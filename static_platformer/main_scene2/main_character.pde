PImage mario1;
PImage mario2;
PImage mario3;
PImage mario4;
PImage deathImage;
PImage leftmario1;
PImage leftmario2;
PImage leftmario3;
PImage leftmario4;

class main_character extends character_base {
  
  boolean is_player;
  int standing_state = 0;
  int jumping_state = 0;
  int walking_state;
  int saved_state=1; 
  int lockwait;
  int invinciblewait;
  boolean exceedrange;
  float xcore;
  float ycore;
  boolean left;
  boolean right = true;
  boolean jump;
  boolean down;
  boolean lrLock;
  boolean letgoUP;
  boolean locked;
  boolean invincible;
  float charSpeed;
  int L=0;
  int R=0;
  float ypos=100;
  float yacc=0.15;
  float yvel=0;
  float xpos=100;
  float xvel=0;
  float xacc=0.02;
  float jumptime;
  int jumps = 2;
  float wait=5;
  float firewait=10;
  float back=1;
  //float X;
  //float Y;
  float VX;
  float VY;
  float G;
  int sizeY;
  int sizeX;
  int score;
  int section;
  boolean death=false;
  ArrayList<PImage>marioList = new ArrayList<PImage>();
  ArrayList<projectile_firebolt> firebolts = new ArrayList<projectile_firebolt>();
  //ArrayList<Integer>coreList = new ArrayList<Integer>();
  main_character(float condamagedeal, String conname, float conhealth, int conlives, float conjump_height, boolean concan_jump, boolean concan_spawn, boolean concan_attack, boolean concan_move, float conarmor, float conresistance) {
    super(condamagedeal, conname, conhealth, conlives, conjump_height, concan_jump, concan_spawn, concan_attack, concan_move, conarmor, conresistance);
    is_player=true;
    conlives=3;
    conhealth=5;
    conjump_height=5;
    concan_move=true;
    concan_jump=true;
    concan_attack=true;
    conarmor=10;
    concan_spawn=true;
    conresistance=7;
    conname="PlayerOne";
    can_spawn=concan_spawn;
    //PImage mario = get(14, 10, 14, 20);
    //PImage mario1 = get(31, 10, 15, 19);
    //PImage mario2 = get(115, 7, 16, 22);
    mario1 = loadImage("Images/mario1.png");
    mario2 = loadImage("Images/mario2.png");
    mario3 = loadImage("Images/mario3.png");
    mario4 = loadImage("Images/mario4.png");
    deathImage = loadImage("Images/mario_die.png");
    leftmario1 = loadImage("Images/left_mario1.png");
    leftmario2 = loadImage("Images/left_mario2.png");
    leftmario3 = loadImage("Images/left_mario3.png");
    leftmario4 = loadImage("Images/left_mario4.png");

    marioList.add(mario1);
    marioList.add(mario2);
    marioList.add(mario3);
    marioList.add(mario4);
    marioList.add(leftmario1);
    marioList.add(leftmario2);
    marioList.add(leftmario3);
    marioList.add(leftmario4);
    xcore = 400;
    ycore = 225;
    sizeY = 20;
    score = 0;
  }
  void lock() {
    locked = true;
    //invincible = true;
    lockwait = 10;
    //invinciblewait = 30;
  }
  void locktimer() {
    lockwait -= 1;
  }
  void invincibletimer() {
    invinciblewait -= 1;
  }
  void unlock() {
    if (lockwait < 1)
      locked = false;
  }
  void invincibleOff() {
    if (invinciblewait < 1)
      invincible = false;
  }
  boolean isOnBlue(color c) {
    //return pixels[y*height+x]
    return c == #6464FF;
  }
  boolean getRight() {
    return right;
  }
  boolean getLeft() {
    return left;
  }
  int getSavedState() {
    return saved_state;
  }
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  void display() {

    if (death) {
      image(deathImage, xcore, ycore, 35, 60);
      left = false;
      right = false;
      xvel = 0;
    }

    //GLOBAL ALGORITHMIC CONSTANTS
    xcore=xcore+xvel; // this is from aidans code, sets the xpos with accurate accel and velocity factors
    ycore=ycore+yvel; // this is from aidans code, sets the ypos with accurate accel and velocity factors
    yvel=yvel+yacc; //other equation for vertical jumping NOTE: THERE ISNT A SECOND COPY WITH -yacc BECAUSE WE DONT NEED TO JUMP DOWNWARDS OFF THE MAP
    //END OF GLOBAL ALGORITHMIC CONSTANTS
    // IF STANDING STATE AND WALKING STATE = 0 THEN MARIO INVISIBLE *fixed*
    // THIS IS THE START OF THE LOGIC LOOP FOR COORDINATE UPDATING
    updateSection();

    color c = get((int)xcore, (int)ycore+sizeY);      // stops infinite falling : Julius

    if (isOnBlue(c) && yvel > 0 && !getDeath()) {
      xvel=.9*xvel;
      if (xvel<.75 && xvel>-0.75) {
        xvel=0;
      }
      yvel = 0;  // stops falling
      jumps = 2;  // resets double jump
    }
    if (firewait>0) { // firebolt cooldown
      firewait=firewait-1;
    }
    if (wait>0) {
      wait=wait-1;
    }
    if (xvel<0) {      // Aidan's code stops mario from skating around : Julius
      xvel=xvel+xacc;
    }
    if (xvel>0) {
      xvel=xvel-xacc;
    }
    if (xcore+sizeX >= 800 || xcore <= 0) {
      xvel = 0;
    }
    if (keyPressed && key == 32 && firewait <= 1) {
      createNewBolt();
      firewait = 20;
    }



    //===========================================================================================================================================
    if (keyPressed && key == CODED) {
      if (keyCode == RIGHT || keyCode == LEFT) {
        if (walking_state==0) { // IF RIGHT ARROW KEY PRESSED
          walking_state=1; // SET THE WALKING STATE TO POSITIVE
          standing_state=0; // MAKE SURE THE GAME RECOGNISES THAT WE AREN'T STANDINMG
        } else if (walking_state==2) {
        } // closes walking state 2
        if (keyCode == RIGHT) { //start of deef for right
          right = true;
          saved_state = 1;
        } else {
          right = false;
        }

        if (keyCode == LEFT) { //start of def for left
          left = true;
          saved_state = -1;
        } else {
          left = false;
        }

        if (keyCode == DOWN) {
          down = true;
        } else if (keyCode != DOWN) {
          down = false;
        }
      }//closes right or left
      //===================================================================================================================================================
      if (keyCode==UP&&jumps>=1&&wait<=1) { //start
        yvel=-7;
        jumps=jumps-1;
        wait=10;
        jumping_state = 1;
        if ((walking_state==1 || walking_state==2) && (jumping_state==1)) { //open2
          yvel=-7;
          jumps=jumps-1;
          wait=10;
          jumping_state = 1;
          if (right && jumping_state==1) { //open3
            xvel=xvel+0.1;
          } //close3
          if (left && jumping_state==1) { //open4
            xvel=xvel-0.1;
          }//close 4
        }//close2
      } else if ((keyCode==RIGHT||keyCode==LEFT)&&(right||left)&&(jumping_state==1)) {
        if (right && jumping_state==1) { //open3
          xvel=xvel+1.41;

          if (xvel>=7) {
            xvel=6.5;
          }
        } //close3
        if (left && jumping_state==1) { //open4
          xvel=xvel-1.41;
          println(xvel);

          if (xvel<=-7) {
            xvel=-6.5;
          }
        }//close 4
      }//closes start
    }//closes key coded
    if (!keyPressed) {
      standing_state=1;
      walking_state=0;
    } //closes not key pressed

    if (yvel == 0) {
      jumping_state = 0;
    }

    if (standing_state==1 && jumping_state == 0) {
      sizeX = 16;
      sizeY = 82;
      if (right) {
        image(marioList.get(0), xcore, ycore);
      }
      if (left) {
        image(marioList.get(4), xcore, ycore);
      }
    }
    if (jumping_state == 1) {
      sizeX = 16;
      sizeY = 82;
      if (right) {
        image(marioList.get(3), xcore, ycore);
      }
      if (left) {
        image(marioList.get(7), xcore, ycore);
      }
    }
    if (walking_state==1 && jumping_state == 0) {
      sizeX = 16;
      sizeY = 82;
      if (right) {
        xvel=4.0; //adian's code stuff
        walking_state=2;
        image(marioList.get(1), xcore, ycore);
      }
      if (left) {
        xvel=-4.0;  //adian's code stuff
        walking_state=2;
        image(marioList.get(5), xcore, ycore);
        //popMatrix();
      }
      //==================================================================
      //Adian's velocity code chunk
      if ((ycore>=ycore+75) || (ycore<=ycore-75)) {
        exceedrange=true;
      }
      if (((ycore>=ycore+75) || (ycore<=ycore-75)) && (exceedrange==true) && ((jumptime==1) || (jumptime==2))) {
        yvel=yvel*.75;
        jumptime=2;
      }
      //=================================================================
    } else if (walking_state==2) {
      sizeY = 82;
      if (right) {
        xvel=4.0; //adian's code stuff
        walking_state=0;
        standing_state=1;
        image(marioList.get(0), xcore, ycore);
      }
      if (left) {
        xvel=-4.0; //aidan's code stuff
        walking_state=0;
        standing_state=1;
        image(marioList.get(4), xcore, ycore);
      }
      //==================================================================
      //Adian's velocity code chunk
      if ((ycore>=ycore+75) || (ycore<=ycore-75)) {
        exceedrange=true;
      }
      if (((ycore>=ycore+75) || (ycore<=ycore-75)) && (exceedrange==true) && ((jumptime==1) || (jumptime==2))) {
        yvel=yvel*.75;
        jumptime=2;
      }
      xcore = xcore + xvel;
    }
  }

  void createNewBolt() {
    firebolts.add(new projectile_firebolt(saved_state, (int)xcore, (int)ycore));
  }

  void changeScore(int change) {
    score += change;
  }

  int getScore() {
    return score;
  }

  float getX() {
    return xcore;
  }

  float getY() {
    return ycore;
  }

  ArrayList<projectile_firebolt> getFireBolts() {
    return firebolts;
  }

  void setSection(int change) {
    section = change;
  }
  void updateSection() {
    if (ycore < 0 && ycore >= height-sizeY) setSection(0);
    if (ycore < height-sizeY && ycore >= 425) setSection(1);
    if (ycore < 425 && ycore >= 425-sizeY) setSection(2);
    if (ycore < 425-sizeY && ycore >= 325) setSection(3);
    if (ycore < 325 && ycore >= 325-sizeY) setSection(4);
    if (ycore < 325-sizeY && ycore >= 325-2*sizeY) setSection(5);
    if (ycore < 325-2*sizeY && ycore >= 325-3*sizeY) setSection(6);
    if (ycore < 325-3*sizeY && ycore >= 325-4*sizeY) setSection(7);
  }
  int getSection() {
    return section;
  }

  void takeHit() {
    if (!invincible)
      lives--;
    if (lives==0) {
      death=true;
    }
  }
  void setXVel(float change) {
    xvel = change;
  }
  void setYVel(float change) {
    yvel = change;
  }
  int getLives() {
    return lives;
  }
  int getSizeX() {
    return sizeX;
  }
  boolean getDeath() {
    return death;
  }
}

