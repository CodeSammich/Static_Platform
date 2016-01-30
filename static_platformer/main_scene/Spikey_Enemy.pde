class spikey_enemy extends character_base{
  String frame1;
  String frame2;
  int isFalling;
  int x; // location we need to find how to change
  int y; // location we need to find how to change
  int speed; // speed
  int direction; // direction
  boolean is_enemy;
  spikey_enemy(float condamagedeal, String conname, float conhealth, int conlives, float conjump_height, boolean concan_jump, boolean concan_spawn, boolean concan_attack, boolean concan_move, float conarmor, float conresistance){
  super(condamagedeal,conname,conhealth,conlives,conjump_height,concan_jump,concan_attack,concan_move,conarmor,conresistance);
  is_enemy=true;
  x = width/2-50;
  y = height-200;
  speed = 2;
  direction = -1;
  frame1 = "spikey.png";
  frame2 = "spikey2.png";
  isFalling = 0;
  }
  
  String getFrame1(){
    return frame1; 
  }
  String getFrame2(){
    return frame2; 
  }
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
  int getSpeed(){
    return speed;
  }
  int getDirection(){
    return direction;
  }
  int getLives(){
    return lives;
  }
  int getFalling(){
    return isFalling;
  }
  void takeHit(){
    lives += -1; 
  }
  
  
}
