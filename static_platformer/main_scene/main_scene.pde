PImage Heart;
PImage Door;
PImage Wall;
PImage GameOver;
float Wait=10;
main_character mario;
spikey_enemy spikey;
ArrayList<spikey_enemy> spikeys = new ArrayList<spikey_enemy>();
ArrayList<projectile_firebolt> firebolts = new ArrayList<projectile_firebolt>();
ArrayList<spikey_enemy> deathS = new ArrayList<spikey_enemy>();
ArrayList<projectile_firebolt> deathF = new ArrayList<projectile_firebolt>();

void setup() {
  frameRate(60);
  size(800, 600);
  Heart = loadImage("Images/heart.png");
  Wall = loadImage("Images/wall.jpg");
  Door = loadImage("Images/door.gif");
  GameOver = loadImage("Images/gameover.jpg");
  //                       damage deal, name, health, lives, jump height, can jump, can spawn, can attack, can move, armor, resistance
  mario=new main_character(2.2, "playerone", 10.5, 3, 5.5, true, true, true, true, 6.7, 5.1);
  spikeys.add(new spikey_enemy(600, 250, 1.0, "spikeyguy", 1.0, 1, 0, false, true, false, true, 1.0, 1.0));
}
void draw() {
  //Respawn Enemy VVV
  if (spikeys.size()<3) {
    spikeys.add(new spikey_enemy(round(random(0, width-100)), round(random(height-300, height-50)), 1.0, "spikeyguy", 1.0, 1, 0, false, true, false, true, 1.0, 1.0));
  }
  if (mario.getDeath()==false) {
    background(255);
    drawBackground();
    mario.display();
    for (spikey_enemy x : spikeys) {
      x.display();
    }
    firebolts = mario.getFireBolts();
    for (projectile_firebolt x : firebolts) {
      x.display();
    }
    stateCheck();
    resetter();
    //println(mario.getLives());
  } else {
    image(GameOver, 0, 0, 800, 600 );
  }
}

void drawBackground() { 
  //image(Wall, 0, 0, 800, 600);
  stroke(139, 69, 19);
  strokeWeight(5);
  fill(160, 82, 45);
  rect(650, -3, 155, 40);
  textSize(23);
  fill(218, 165, 32);
  text("Lives:", 660, 25);
  fill(255, 40, 40);
  noStroke();
  // Score
  stroke(139, 69, 19);
  strokeWeight(5);
  fill(160, 82, 45);
  rect(490, -3, 155, 40);
  textSize(23);
  fill(218, 165, 32);
  text("Score: "+mario.getScore(), 500, 25);
  fill(255, 40, 40);
  noStroke();
  if (mario.getLives()>=1) {
    image(Heart, 725, 10, 20, 20);
  }
  if (mario.getLives()>=2) {
    image(Heart, 750, 10, 20, 20);
  }
  if (mario.getLives()>=3) {
    image(Heart, 775, 10, 20, 20);
  }
  //image(Door, 300, 355, 200, 280);
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

void stateCheck() { // calls on each object for xy values to see which should react and how
  int wait = 0; // cooldown for mario taking hits
  for (spikey_enemy e : deathS) {
    spikeys.remove(e);
  }
  for (projectile_firebolt f : deathF) {
    firebolts.remove(f);
  }
  deathF = new ArrayList<projectile_firebolt>();
  deathS = new ArrayList<spikey_enemy>();
  // enemy vs firebolt detection
  if (spikeys.size() != 0 || firebolts.size() != 0) {
    for (spikey_enemy enem : spikeys) {
      for (projectile_firebolt fire : firebolts) {
        if (abs(enem.getX()-fire.getX()) <= 60 && enem.getSection() == fire.getSection()) {
          deathS.add(enem);
          deathF.add(fire);
          mario.changeScore(10);
        }
      }
    }
  }
  // enemy vs main character detection
  for (spikey_enemy enem : spikeys) {
    if (abs(enem.getX()-mario.getX()) <= 60 && abs(enem.getY()-mario.getY()) <= 30 && wait <= 0) {
      mario.takeHit();
      if (mario.getX() > enem.getX()+width/28) {
        mario.setXVel(15);
      }
      if (mario.getX() < enem.getX()+width/28) {
        mario.setXVel(-15);
      }
      mario.setYVel(-4);
      //mario.lock();
    }
  }
}

void resetter() {
  //mario.locktimer();
  //mario.invincibletimer();
  //mario.unlock();
  //mario.invincibleOff();
}