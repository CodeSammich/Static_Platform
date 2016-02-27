PImage Heart;
PImage Door;
PImage Wall;
int Lives=3;
float Wait=10;
main_character mario;
spikey_enemy spikey;

void setup() {
  frameRate(60);
  size(800, 600);
  Heart = loadImage("Images/heart.png");
  Wall = loadImage("Images/wall.jpg");
  Door = loadImage("Images/door.gif");
  //                       damage deal, name, health, lives, jump height, can jump, can spawn, can attack, can move, armor, resistance
  mario=new main_character(2.2, "playerone", 10.5, 3, 5.5, true, true, true, true, 6.7, 5.1);
  spikey= new spikey_enemy(1.0, "spikeyguy", 1.0, 1, 0, false, true, false, true, 1.0, 1.0);
}
void draw() {
  background(255);
  drawBackground();
  mario.display();
  spikey.display();
  for(projectile_firebolt x : mario.getFireBolts()){
    x.display(); 
  }
}
/*void keyPressed() {
 if (keyCode==UP&&Lives<3&&Wait<1) {
 Lives=Lives+1;
 Wait=10;
 }
 if (keyCode==DOWN&&Lives>0&&Wait<1) {
 Lives=Lives-1; 
 Wait=10;
 }
 }*/
void drawBackground() { 
  image(Wall, 0, 0, 800, 600);
  //Lives
  stroke(139, 69, 19);
  strokeWeight(5);
  fill(160, 82, 45);
  rect(650, -3, 155, 40);
  textSize(23);
  fill(218, 165, 32);
  text("Lives:", 660, 25);
  fill(255, 40, 40);
  noStroke();
  if (Lives>=1) {
    image(Heart, 725, 10, 20, 20);
  }
  if (Lives>=2) {
    image(Heart, 750, 10, 20, 20);
  }
  if (Lives>=3) {
    image(Heart, 775, 10, 20, 20);
  }
  image(Door, 300, 355, 200, 280);
  noStroke();
  fill(100, 100, 255);
  rect(100, 425, 150, 15);
  rect(550, 425, 150, 15);
  rect(300, 325, 200, 15);
  rect(0, 585, 800, 15); 
  /*
stroke(139,69,19);
   fill(160,82,45);
   arc(400,475,150,150,2.96706,6.45772,OPEN);
   noStroke();
   beginShape();
   vertex(475,475);
   vertex(475,620);
   vertex(325,620);
   vertex(326,475);
   endShape(CLOSE);
   stroke(129,59,10);
   line(400,402,400,620);
   stroke(139,69,19);
   line(473,475,475,620);
   line(326,475,325,620);
   line(380,406,380,620);
   line(420,406,420,620);
   line(360,411,360,620);
   line(440,411,440,620);
   line(340,429,340,620);
   line(460,429,460,620);
   noFill();
   strokeWeight(4);
   stroke(255,215,0);
   ellipse(370,515,30,30);
   ellipse(430,515,30,30);
   */
  if (Wait>0) {
    Wait=Wait-1;
  }
  //println(Wait);
  
}
// Add background to display on this file here
//merge background files into the main scene folder
//try to set a standard screensize
//change anything you want above

//Updated with background
//Added Mario Basic Display Only

void stateCheck(){ // calls on each object for xy values to see which should react and how
    
}
