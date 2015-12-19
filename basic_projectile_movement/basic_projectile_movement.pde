
// BASIC PROJECTILE MOVEMENT

// Images
PImage img;
PImage img2;

// Character dependent variables
int x;
int y;
int lr;
int spd;
String type;

void setup(){
  size(1000, 700);
  img = loadImage("filename.png");
  img.resize(0,50 /* scale to width */);
  x = width/2-50 /* scale to width */;     // x cor
  y = height-50 /* scale to height */;     // y cor
  lr = 1;                                  // direction
  spd = 2;                                 // speed
  type = "firebolt";                         // source character
}

void draw(){
  background(0,0,0)
  if(lr == -1) image(img,x,y);                                      // left facing img
  if(lr == 1)  image(img2,x,y);                                     // right facing img
  x += spd /* scale to width/difficulty/framerate */ *lr;           // move speed
  if(hit(type, xcor, ycor)) die();
}
  
