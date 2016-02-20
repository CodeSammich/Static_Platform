class main_character extends character_base {
  boolean is_player;
  int standing_state;
  int jumping_state;
  int walking_state;
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
  float wait=5;
  float back=1;
  //float X;
  //float Y;
  float VX;
  float VY;
  float G;
  int sizeY;
  ArrayList<PImage>marioList = new ArrayList<PImage>();
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
    PImage mario = get(14, 10, 14, 20);
    PImage mario1 = get(31, 10, 15, 19);
    PImage mario2 = get(115, 7, 16, 22);
    marioList.add(mario);
    marioList.add(mario1);
    marioList.add(mario2);
    xcore = 175;
    ycore = 175;
    sizeY = 20;
  }
  
  boolean isOnBlue(color c) {
    //return pixels[y*height+x]
    return c == #6464FF;
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
    
    color c = get((int)xcore, (int)ycore+sizeY);      // stops infinite falling
    if (isOnBlue(c)) yvel = 0;
    
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
          } else if (keyCode != RIGHT) {
            right = false;
          }//closes not right
          if (keyCode == LEFT) { //start of def for left
            left = true;
          } else if (keyCode != LEFT) {
            left = false;
          }//closes not left
        }//closes right or left
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
        }//closes up code which should be running seperate from "right or left" code so you can jump without having to move left or right first
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
      sizeY = 20;
      if (right) {
        image(marioList.get(0), xcore, ycore);
      }
      if (left) {
        //pushMatrix();
        //scale(-1.0, 1.0);
        image(marioList.get(0), xcore, ycore);
        //popMatrix();
      }
    }
    if (walking_state==1) {
      sizeY = 19;
      if (right) {
        xvel=4; //adian's code stuff
        xcore=xcore+8;
        walking_state=2;
        //      image(marioList.get(0), xcore, ycore);
        //      delay(10);
        delay(40);
        image(marioList.get(1), xcore, ycore);
      }
      if (left) {
        xvel=-4;  //adian's code stuff
        xcore=xcore-8;
        walking_state=2;
        delay(40);
        //pushMatrix();
        //scale(-1.0, 1.0);
        image(marioList.get(1), xcore, ycore);
        //popMatrix();
      }
      //==================================================================
      //Adian's velocity code chunk
      if (xvel<0) {
        xvel=xvel+xacc;
      }
      if (xvel>0) {
        xvel=xvel-xacc;
      }
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
        xcore=xcore+8;
        walking_state=0;
        standing_state=1;
        delay(40);
        image(marioList.get(0), xcore, ycore);
      }
      if (left) {
        xvel=-4; //aidan's code stuff
        xcore=xcore-8;
        walking_state=0;
        standing_state=1;
        delay(40);
        //pushMatrix();
        //scale(-1.0, 1.0); //DONT FORGET THIS CODE FUCKS UP EVERYTHING
        image(marioList.get(0), xcore, ycore);
        //popMatrix();
      }
      //==================================================================
      //Adian's velocity code chunk
      if (xvel<0) {
        xvel=xvel+xacc;
      }
      if (xvel>0) {
        xvel=xvel-xacc;
      }
      if ((ycore>=ycore+75) || (ycore<=ycore-75)) {
        exceedrange=true;
      }
      if (((ycore>=ycore+75) || (ycore<=ycore-75)) && (exceedrange==true) && ((jumptime==1) || (jumptime==2))) {
        yvel=yvel*.75;
        jumptime=2;
      }
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
}
