/*int L=0;
 int R=0;
 boolean Left;
 boolean Right;
 float ypos=100;
 float yacc=0.15;
 float yvel=1;
 float xpos=100;
 float xvel=0;
 float xacc=0.05;
 float jump=2;
 float wait=5;
 float back=1;
 void gravitymovement() {
 if (back==1) {
 background(200, 200, 255);
 }
 if (Left==true) {
 xvel=-1;
 }
 if (Right==true) {
 xvel=1;
 }
 xpos=xpos+xvel;
 if (xvel<0) {
 xvel=xvel+xacc;
 }
 if (xvel>0) {
 xvel=xvel-xacc;
 }
 fill(196, 222, 58); // this section is where you add the movement
 ellipse(xpos, ypos, 50, 50);//  this section is where stuff moves
 ypos=ypos+yvel; //equation of positioning
 yvel=yvel+yacc; //other equation of positioning
 if (ypos>=575) {
 yvel=-7;
 jump=2;
 }
 if (wait>0) {
 wait=wait-1;
 }
 }
 void keyPressed() {
 if (keyCode==LEFT) {
 Left=1;
 }
 if (keyCode==RIGHT) {
 Right=1;
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
 Left=0;
 }
 if (keyCode==RIGHT) {
 Right=0;
 }
 }*/