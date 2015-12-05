PImage spritesheet;
PImage mario;
int imgx=0;
int imgy=0;
int imgw=500;
int imgh=500;
void setup() {
  size(500, 500);
  spritesheet=loadImage("Images/mariospritesheet.png");
  image(spritesheet, 0, 0);
  mario = get(10, 10, 20, 20);
  background(255);
}

void draw() {
  image(mario, width/91, 20);
  //image(mario, imgx, imgy, imgw, imgh);
}

