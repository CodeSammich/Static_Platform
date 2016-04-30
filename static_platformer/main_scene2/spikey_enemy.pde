  class spikey_enemy extends character_base {
  String frame1;
  String frame2;
  PImage img;
  PImage img2;
  int isFalling;
  int x; // location we need to find how to change
  int y; // location we need to find how to change
  int section;
  int sizeX;
  int sizeY;
  int speed; // speed
  int direction; // direction
  float VY = 2;
  float G = .1;
  boolean is_enemy;
  spikey_enemy(int XCoord, int YCoord, float condamagedeal, String conname, float conhealth, int conlives, float conjump_height, boolean concan_jump, boolean concan_spawn, boolean concan_attack, boolean concan_move, float conarmor, float conresistance) {
    super(condamagedeal, conname, conhealth, conlives, conjump_height, concan_jump, concan_spawn, concan_attack, concan_move, conarmor, conresistance);
    is_enemy=true;
    x = XCoord;
    y = YCoord;
    sizeX = width/14;
    sizeY = height/10;
    speed = 2;
    direction = -1;
    frame1 = "Images/spikey.png";
    frame2 = "Images/spikey2.png";
    isFalling = 0;
    img  = loadImage(frame1);
    img2 = loadImage(frame2);
  }

  String getFrame1() {
    return frame1;
  }
  String getFrame2() {
    return frame2;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  int getSpeed() {
    return speed;
  }
  void halt(){
    
  }
  int getDirection() {
    return direction;
  }
  int getLives() {
    return lives;
  }
  int getFalling() {
    return isFalling;
  }
  int getSection(){
    return section; 
  }
  boolean isOnBlue(color c) {
    //return pixels[y*height+x]
    return c == #6464FF;
  }
  void takeHit() {
    lives += -1;
  }
  void setFalling(int change) {
    isFalling = change;
  }
  void setY(int change) {
    y = change;
  }
  void setX(int change) {
    x = change;
  }
  void setDirection(int change) {
    direction = change;
  }
  void setSection(int change){
    section = change; 
  }
  void updateSection(){
    if(y < 0 && y >= height-sizeY) setSection(0);
    if(y < height-sizeY && y >= 425) setSection(1);
    if(y < 425 && y >= 425-sizeY) setSection(2);
    if(y < 425-sizeY && y >= 325) setSection(3);
    if(y < 325 && y >= 325-sizeY) setSection(4);
    if(y < 325-sizeY && y >= 325-2*sizeY) setSection(5);
    if(y < 325-2*sizeY && y >= 325-3*sizeY) setSection(6);
    if(y < 325-3*sizeY && y >= 325-4*sizeY) setSection(7);
  }
  void display() {
    //if(this != null){
    //println("something loaded");
    if (direction == -1) image(img, x, y /* scale to height */, sizeX, sizeY);
    if (direction == 1)  image(img2, x, y /* scale to height */, sizeX, sizeY);
    //println("direction works?!?!");
    color c = get(x, y+sizeY);
    if (isOnBlue(c)) setFalling(0);
    else setFalling(1);
    if (getFalling() == 1) {
      VY=VY-G;
      setY((int)(getY()-VY));
    }
    setX(getX() + this.getSpeed() /* scale to width/difficulty/framerate */ * getDirection());
    if ((x <= 0)||(x >= width-50 /* scale to width */)) setDirection(getDirection() * -1);
    
    updateSection();
  }
  //}
}
