class spikey_enemy extends character_base{
  String frame1;
  String frame2;
  PImage img;
  PImage img2;
  int isFalling;
  int x; // location we need to find how to change
  int y; // location we need to find how to change
  int speed; // speed
  int direction; // direction
  float VY = 2;
  float G = .1;
  boolean is_enemy;
  spikey_enemy(float condamagedeal, String conname, float conhealth, int conlives, float conjump_height, boolean concan_jump, boolean concan_spawn, boolean concan_attack, boolean concan_move, float conarmor, float conresistance){
  super(condamagedeal,conname,conhealth,conlives,conjump_height,concan_jump,concan_spawn,concan_attack,concan_move,conarmor,conresistance);
  is_enemy=true;
  x = width/2-50;
  y = height-200;
  speed = 2;
  direction = -1;
  frame1 = "Images/spikey.png";
  frame2 = "Images/spikey2.png";
  isFalling = 0;
  img  = loadImage(frame1);
  img2 = loadImage(frame2);
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
  boolean isOnBlue(color c){
    //return pixels[y*height+x]
    return c == #6464E1;
  }
  void takeHit(){
    lives += -1; 
  }
  void setFalling(int change){
    isFalling = change;
  }
  void setY(int change){
    y = change;
  }
  void setX(int change){
    x = change;
  }
  void setDirection(int change){
    direction = change;
  }
  void display(){
    if(this != null){
      if(getDirection() == -1) image(img,x,y /* scale to height */);
      if(getDirection() == 1)  image(img2,x,y /* scale to height */);
      color c = get(x,y+50);
      if(isOnBlue(c)) setFalling(0);
      else setFalling(1);
      if(getFalling() == 1){
      VY=VY-G;
      setY((int)(getY()-VY));
      }
      setX(getX() + this.getSpeed() /* scale to width/difficulty/framerate */ * getDirection());
      if((x <= 0)||(x >= width-50 /* scale to width */)) setDirection(getDirection() * -1);
      if(mousePressed) this.takeHit();
      if(getLives() < 1) super.kill(this);
    }
  }
  
  
}