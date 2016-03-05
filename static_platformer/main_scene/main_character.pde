PImage mario1;
PImage mario2;
PImage mario3;
PImage mario4;
PImage leftmario1;
PImage leftmario2;
PImage leftmario3;
PImage leftmario4;

class main_character extends character_base {
  boolean is_player;
  int standing_state;
  int jumping_state;
  int walking_state;
  int saved_state=1; 
  boolean exceedrange;
  float xcore;
  float ycore;
  boolean left;
  boolean right;
  boolean jump;
  boolean crouch;
  boolean lrLock;
  boolean letgoUP;
  float charSpeed;
  int L=0;
  int R=0;
  float ypos=100;
  float yacc=0.15;
  float yvel=0;
  float xpos=100;
  float xvel=0;
  float xacc=0.05;
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
    PImage spritesheet;
    spritesheet=loadImage("Images/mariospritesheet.png");
    image(spritesheet, 0, 0);
    //PImage mario = get(14, 10, 14, 20);
    //PImage mario1 = get(31, 10, 15, 19);
    //PImage mario2 = get(115, 7, 16, 22);
    mario1 = loadImage("Images/mario1.png");
    mario2 = loadImage("Images/mario2.png");
    mario3 = loadImage("Images/mario3.png");
    mario4 = loadImage("Images/mario4.png");
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
    xcore = 175;
    ycore = 175;
    sizeY = 20;
  }
  
  boolean isOnBlue(color c) {
    //return pixels[y*height+x]
    return c == #6464FF;
  }
  
  boolean getRight(){
    return right;
  }
  
  boolean getLeft(){
    return left;
  }
  
  int getSavedState(){
    return saved_state;
  }
  
  void display() {
    println("You have jumped "+ jumptime+ " times");
    //println("You have a y velocity of "+ yvel);
    //GLOBAL ALGORITHMIC CONSTANTS
    xcore=xcore+xvel; // this is from aidans code, sets the xpos with accurate accel and velocity factors
    ycore=ycore+yvel; // this is from aidans code, sets the ypos with accurate accel and velocity factors
    yvel=yvel+yacc; //other equation for vertical jumping NOTE: THERE ISNT A SECOND COPY WITH -yacc BECAUSE WE DONT NEED TO JUMP DOWNWARDS OFF THE MAP
    //END OF GLOBAL ALGORITHMIC CONSTANTS
    // IF STANDING STATE AND WALKING STATE = 0 THEN MARIO INVISIBLE *fixed*
    // THIS IS THE START OF THE LOGIC LOOP FOR COORDINATE UPDATING
    
    color c = get((int)xcore, (int)ycore+sizeY);      // stops infinite falling : Julius
    if (isOnBlue(c) && yvel > 0){
      yvel = 0;  // stops falling
      jumps = 2;  // resets double jump
    }
    
    if (firewait>0){ // firebolt cooldown
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
    
    if (xcore+sizeX >= 800 || xcore <= 0){
      xvel = 0;
    }
    
    if(keyPressed && key == 32 && firewait <= 1){
      createNewBolt();
      firewait = 20;
    }
    
    //if (abs(xvel) < 0.1){ // stops mario from creeping to the left after he goes right
    //  xvel = 0;
    //}
    
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == RIGHT || keyCode == LEFT) {
          if (walking_state==0) { // IF RIGHT ARROW KEY PRESSED
            walking_state=1; // SET THE WALKING STATE TO POSITIVE
            standing_state=0; // MAKE SURE THE GAME RECOGNISES THAT WE AREN'T STANDINMG
            /*prevxcore=xcore; //The previous coordinate is set to the coordinate we are in now
             newxcore=xcore+10;//THe future coordinate is set to the coordinate we are in now plus 10 more since we are going right
             delay(1);//add a supersmall delay to prevent overloading of code
             xcore=newxcore;*/            // current coordinate is set to the future one
          } else if (walking_state==2) {
            //walking_state=1;
            //tanding_state=0;
          } // closes walking state 2
          if (keyCode == RIGHT) { //start of deef for right
            right = true;
            saved_state = 1;
          } else if (keyCode != RIGHT) {
            right = false;
          }//closes not right
          if (keyCode == LEFT) { //start of def for left
            left = true;
            saved_state = -1;
          } else if (keyCode != LEFT) {
            left = false;
          }//closes not left
        }//closes right or left
        
        /* old jump code being replaced with aidans newer code : Julius
        if ((keyCode == UP)&&(jumptime<=1)) {
          println("DID YOU JUMP?"+ jump);
          if (!jump) {
            jump=true;
            jumptime=jumptime+1;
            yvel=-9;
          } else if ((keyCode != UP) && (jump) && (jumptime<=1)) {
            letgoUP=true;
            println("DID YOU LET GO OF UP?"+ letgoUP);
          } else if ((keyCode == UP)&&(letgoUP==true)&&(jumptime==1)) {
            jump=true;
            jumptime=jumptime+1;
            yvel=-5;
          } else if ((keyCode == UP)&&(jumptime==2)) {
            yvel=yvel-(yvel*.75);
            if (yvel*.75<=3) {
              yvel=yvel*3.45;
            }
          }
        } */ //closes up code which should be running seperate from "right or left" code so you can jump without having to move left or right first
        
        if (keyCode==UP&&jumps>=1&&wait<=1) {
          yvel=-7;
          jumps=jumps-1;
          wait=10;
        }
        
      }//closes key coded
    }//closes key pressed
    if (!keyPressed) {
      standing_state=1;
      walking_state=0;
    } //closes not key pressed
    /*if (keyPressed) { // read above comments and basically the same thing but
     walking_state=1;//set walking state positive
     standing_state=0;//make sure game recognises that we are moving
                                                                                                                                                                                                                                                                                            /*prevxcore=xcore;
     newxscore=xcore-10; // however it is -10 here so we move backwards
     delay(1);
     xcore=newxcore;
     }*/
    if (standing_state==1) {
      image(marioList.get(0), xcore, ycore);
      //image(mario1);
      sizeX = 14;
      sizeY = 20;
      if (right) {
        image(marioList.get(0), xcore, ycore);
      }
      if (left) {
        //pushMatrix();
        //scale(-1.0, 1.0);
        image(marioList.get(4), xcore, ycore);
        //popMatrix();
      }
    }
    if (walking_state==1) {
      sizeX = 15;
      sizeY = 19;
      if (right) {
        xvel=4; //adian's code stuff
        //xcore=xcore+8;
        walking_state=2;
        //      image(marioList.get(0), xcore, ycore);
        //      delay(10);
        // removed delay to remove lag, hope this isnt important : Julius
        image(marioList.get(1), xcore, ycore);
      }
      if (left) {
        xvel=-4;  //adian's code stuff
        //xcore=xcore-8;
        walking_state=2;
        // removed delay
        //pushMatrix();
        //scale(-1.0, 1.0);
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
      sizeY = 20;
      if (right) {
        xvel=4; //adian's code stuff
        //xcore=xcore+8;
        walking_state=0;
        standing_state=1;
        // removed delay
        image(marioList.get(0), xcore, ycore);
      }
      if (left) {
        xvel=-4; //aidan's code stuff
        //xcore=xcore-8;
        walking_state=0;
        standing_state=1;
        // removed delay
        //pushMatrix();
        //scale(-1.0, 1.0); //DONT FORGET THIS CODE FUCKS UP EVERYTHING
        image(marioList.get(4), xcore, ycore);
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
      xcore = xcore + xvel;
      //=================================================================
      /*if(leftkeyheld) {
       Walking_state=1;
       Standing_state=0;
       //marioList.get(0);
       //marioList.get(1);
       //marioList.get(2);
       if(Standing_state==1) {
       xcor+1
       image(marioList.get(1), xcor, ycor);
       }
       //image(mario, imgx, imgy, imgw, imgh);
       */
    }
  }
  void createNewBolt(){
    firebolts.add(new projectile_firebolt(saved_state,(int)xcore,(int)ycore));
  }
  
  ArrayList<projectile_firebolt> getFireBolts(){
    return firebolts; 
  }
}