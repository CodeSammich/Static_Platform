PImage marioR;
PImage marioL;
int L=0;
int R=0;
float ypos=100;
float yacc=0.15;
float yvel=1;
float xpos=100;
float xvel=0;
float xacc=0.04;
int jump=2;
float wait=5;
float back=1;
int side=0;
void setup() {
  size(800, 600);
  marioR = loadImage("marioR.png");
  marioL = loadImage("marioL.png");
}
void draw() {
  println(xvel);
  if (back==1) {
    background(200, 200, 255);
  }
  if (L==1) {
    xvel=-4;
  }
  if (R==1) {
    xvel=4;
  }
  xpos=xpos+xvel;
  if (xvel<0) {
    xvel=xvel+xacc;
  }
  if (xvel>0) {
    xvel=xvel-xacc;
  }
  fill(196, 222, 58);
  if (side==1) {
    image(marioR, xpos-75, ypos-70, 100, 100);
  }
  if (side==-1) {
    image(marioL, xpos-75, ypos-70, 100, 100);
  }
  ypos=ypos+yvel;
  yvel=yvel+yacc;

  if (ypos>=575) {
    yvel=-7;
    jump=2;
  }
  if (wait>0) {
    wait=wait-1;
  }

  fill(180, 180, 230);
  stroke(0, 0, 0);
  strokeWeight(3);
  rect(705, -5, 100, 30);
  if (jump>=2) {
    fill(0, 255, 0);
  }
  if (jump==1) {
    fill(255, 255, 0);
  }
  if (jump<1) {
    fill(255, 0, 0);
  }
  textSize(22);
  text("Jumps: ", 710, 20);
  text(jump, 785, 20);
  strokeWeight(1);

  if(dist(0,0,xvel,0)<0.1){
  xvel=0;
  }
}
void keyPressed() {
  if (keyCode==LEFT) {
    L=1;
    side=-1;
  }
  if (keyCode==RIGHT) {
    R=1;
    side=1;
  }
  if (keyCode==UP&&jump>=1&&wait<=1) {
    yvel=-7;
    jump=jump-1;
    wait=10;
  }
  if (key==' ') {
    back=back*-1;
  }
}
void keyReleased() {
  if (keyCode==LEFT) {
    L=0;
  }
  if (keyCode==RIGHT) {
    R=0;
  }
}

