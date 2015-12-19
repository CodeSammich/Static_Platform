PImage Heart;
//PImage Door;
PImage Wall;
int Lives=3;
void setup(){
size(800,600);
Heart = loadImage("http://lenkom.org/p/2015/12/cartoon-heart-1mzntaqe.png");
Wall = loadImage("https://c1.staticflickr.com/3/2788/4507998578_37a8608634.jpg");
//Door = loadImage("http://www.oocities.org/grannyo_2001/misc2/door.gif");
}
void draw(){
  image(Wall,0,0,800,600);
//Lives
  stroke(139,69,19);
  strokeWeight(5);
  fill(160,82,45);
  rect(650,-3,155,40);
  textSize(23);
  fill(218,165,32);
  text("Lives:",660,25);
  fill(255,40,40);
  noStroke();
  if(Lives>=1){
    image(Heart,725,10,20,20);
  }
  if(Lives>=2){
    image(Heart,750,10,20,20);
  }
  if(Lives>=3){
    image(Heart,775,10,20,20);
  }
noStroke();
fill(100,100,255);
rect(100,425,150,15);
rect(550,425,150,15);
rect(300,325,200,15);
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
}
void keyPressed(){
if(key=='l'){
Lives=Lives-1;
}
}
