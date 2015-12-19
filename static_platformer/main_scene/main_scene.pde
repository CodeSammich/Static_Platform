PImage spritesheet;
ArrayList<PImage>marioList = new ArrayList<PImage>();
int Standing_state=0;
int Jumping_state=0;
int Walking_state=0;

void setup() {
  size(500, 500);
  spritesheet=loadImage("Images/mariospritesheet.png");
  image(spritesheet, 0, 0);
  PImage mario = get(14, 10, 14, 20);
  PImage mario1 = get(31, 10, 15, 19);
  PImage mario2 = get(115, 7, 16, 22);
  background(255);
  marioList.add(mario);
  marioList.add(mario1);
  marioList.add(mario2);
}
void draw() {
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

