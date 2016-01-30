
// BASIC ENEMY MOVEMENT

PImage img;
PImage img2;

int x;
int y;
int lr;
int fall;
float VY = 2;
float G = .1;

spikey_enemy temp;

void setup() {
  size(1000, 700);
  temp = new spikey_enemy(1, 0, false, true, true, 0, 0);
  img  = loadImage(temp.getFrame1());
  img2 = loadImage(temp.getFrame2());
  img.resize(0, 50 /* scale to width */);
  img2.resize(0, 50 /* scale to width */);
  x = temp.getX() /* scale to width */;
  y = temp.getY();
  lr = temp.getDirection();
  fall = temp.getFalling();
}

void draw() {
  background(0, 0, 0);
  fill(#0000ff);
  stroke(#0000ff);
  rect(0, height-10, 1000, 10);
  if (temp != null) {
    if (lr == -1) image(img, x, y /* scale to height */);
    if (lr == 1)  image(img2, x, y /* scale to height */);
    color c = get(x, y+50);
    if (isOnBlue(c)) fall = 0;
    else fall = 1;
    if (fall == 1) {
      VY=VY-G;
      y=(int)(y-VY);
    }
    x += temp.getSpeed() /* scale to width/difficulty/framerate */ * lr;
    if ((x <= 0)||(x >= width-50 /* scale to width */)) lr *= -1;
    if (mousePressed) temp.takeHit();
    if (temp.getLives() < 1) temp = null;
  }
}

boolean isOnBlue(color c) {
  //return pixels[y*height+x]
  return c == #0000ff;
}

