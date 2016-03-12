class projectile_firebolt{
  String frameL1="Images/fireball1.png";
  String frameL2="Images/fireball2.png";
  String frameR1="Images/fireball3.png";
  String frameR2="Images/fireball4.png";
  int frameswitch=1;
  PImage img1;
  PImage img2;
  PImage img3;
  PImage img4;
  String name;
  boolean is_projectile;
  boolean player_proj;
  int speed;
  int damage;
  int direction;
  int x;
  int y;
  int sizeX;
  int sizeY;
  projectile_firebolt(int condirection, int conspawnx, int conspawny){
    is_projectile = true;
    player_proj = true;
    damage = 1;
    direction = condirection;
    speed = 2;
    name = "firebolt";
    x = conspawnx;
    y = conspawny;
    sizeX=40;
    sizeY=30;
    img1 = loadImage(frameL1);
    img2 = loadImage(frameL2);
    img3 = loadImage(frameR1);
    img4 = loadImage(frameR2);
  }
  
  void display(){
    if(frameCount%25 == 0) frameswitch = frameswitch *-1;
    if(direction == 1){
      if(frameswitch == 1) image(img3,x,y,sizeX,sizeY);
      else image(img4,x,y,sizeX,sizeY);
    }
    if(direction == -1){
      if(frameswitch == 1) image(img1,x,y,sizeX,sizeY);
      else image(img2,x,y,sizeX,sizeY); 
    }
    x += speed * direction;
  }
  
  int getX(){
    return x; 
  }
  
  int getY(){
    return y; 
  }
  
}