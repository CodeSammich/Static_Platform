
// BASIC ENEMY MOVEMENT

PImage img;
PImage img2;

int x;
int lr;

void setup(){
   size(1000, 700);
   img  = loadImage("spikey.png");
   img2 = loadImage("spikey2.png");
   img.resize(0,50 /* scale to width */);
   img2.resize(0,50 /* scale to width */);
   x = width/2-50 /* scale to width */;
   lr = -1;
}

void draw(){
  background(0,0,0);
  if(lr == -1) image(img,x,height-50 /* scale to height */);
  if(lr == 1)  image(img2,x,height-50 /* scale to height */);
  x += 2 /* scale to width/difficulty/framerate */ *lr;
  if((x <= 0)||(x >= width-50 /* scale to width */)) lr *= -1;
}
  
