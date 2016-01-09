class main_character extends character_base {
  boolean is_player;
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
  }
  PImage spritesheet;
  ArrayList<PImage>marioList = new ArrayList<PImage>();
  //ArrayList<Integer>coreList = new ArrayList<Integer>();
  int standing_state=0;
  int jumping_state=0;
  int walking_state=0;

  void setup() {
    size(500, 500);
    spritesheet=loadImage("Images/mariospritesheet.png");
    image(spritesheet, 0, 0);
    PImage mario = get(14, 10, 14, 20);
    PImage mario1 = get(31, 10, 15, 19);
    PImage mario2 = get(115, 7, 16, 22);
    int xcore = 50;
    int ycore = 50;
    background(255);
    marioList.add(mario);
    marioList.add(mario1);
    marioList.add(mario2);
  }
  void draw() {
    while (can_spawn=true) {
      while (1==1) {    // THIS IS THE START OF THE LOGIC LOOP FOR COORDINATE UPDATING
        if (keyPressed) { // IF RIGHT ARROW KEY PRESSED
          walking_state=1; // SET THE WALKING STATE TO POSITIVE
          standing_state=0; // MAKE SURE THE GAME RECOGNISES THAT WE AREN'T STANDINMG
          /*prevxcore=xcore; //The previous coordinate is set to the coordinate we are in now
           newxcore=xcore+10;//THe future coordinate is set to the coordinate we are in now plus 10 more since we are going right
           delay(1);//add a supersmall delay to prevent overloading of code
           xcore=newxcore;*/          // current coordinate is set to the future one
        }
        if (oppositekeypressed) { // read above comments and basically the same thing but
          walking_state=1;
          standing_state=0;
          /*prevxcore=xcore;
           newxscore=xcore-10; // however it is -10 here so we move backwards
           delay(1);
           xcore=newxcore;*/
        }
        walking_state=1;
        if (standing_state==1) {
          image(marioList.get(0), xcore, ycore);
        }
        if (walking_state==1) {
          image(marioList.get(1), xcore-10, ycore);
          delay(10);
          image(marioList.get(1), xcore+10, ycore);
        }
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
}

