PImage Heart;
PImage Door;
PImage Wall;
PImage GameOver;
float Wait=10;
int enemSpawnTimer=50;
int scoreTimer = 25;
int gameOverTimer = 25;
int flashTimer = 10;
main_character mario;
spikey_enemy spikey;
ArrayList<spikey_enemy> spikeys = new ArrayList<spikey_enemy>();
ArrayList<projectile_firebolt> firebolts = new ArrayList<projectile_firebolt>();
ArrayList<spikey_enemy> deathS = new ArrayList<spikey_enemy>();
ArrayList<projectile_firebolt> deathF = new ArrayList<projectile_firebolt>();
int framecounter = 0;
float ab = 200;
float bb = 200;
float cb = 600;
float db = 200;
float eb = 200;
float fb = 400;
float gb = 600;
float hb = 400;

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
  if (spikeys.size()<3 && enemSpawnTimer < 0 && !mario.getDeath()) {
    spikeys.add(new spikey_enemy(round(random(0, width-100)), round(random(height-300, height-50)), 1.0, "spikeyguy", 1.0, 1, 0, false, true, false, true, 1.0, 1.0));
    enemSpawnTimer = 50;
  }
  enemSpawnTimer--;
  background(255);
  drawBackground();
  for (spikey_enemy x : spikeys) {
    x.display();
  }
  firebolts = mario.getFireBolts();
  for (projectile_firebolt x : firebolts) {
    x.display();
  }
  mario.display();
  stateCheck();
  resetter();
  if (!mario.getDeath() && scoreTimer < 0) {
    mario.changeScore(1);
    scoreTimer = 25;
  }
  scoreTimer--;
  if (mario.getDeath()) {
    deathAnimation();
  }
}

void deathAnimation() {
  for (spikey_enemy enem : spikeys) {
    enem.halt();
    
  }
  for (projectile_firebolt fire : firebolts) {
    fire.halt();
  }
  if (mario.getY() > height) {
    gameOverTimer--;
    if(gameOverTimer <= 0){
      image(GameOver, 0, 0, 800, 600 );
      if(mousePressed) setup();
    }
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

  noStroke();
  fill(100, 100, 255);
  framecounter += 1;
  if (framecounter%300 == 299) {
    ab = random(0, 400);
    bb = random(100, 300);
    cb = random(400, 700);
    db = random(100, 300);
    eb = random(0, 400);
    fb = random(300, 500);
    gb = random(400, 700);
    hb = random(300, 500);
  }
  rect(ab, bb, 150, 15);
  rect(cb, db, 600, 15);
  rect(eb, fb, 200, 15);
  rect(gb, hb, 100, 15);
  rect(-100, 585, 900, 15); 

  if (Wait>0) {
    Wait=Wait-1;
  }
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
      if(enem.getSpeed() == 0) deathS.add(enem);
      for (projectile_firebolt fire : firebolts) {
        if (abs(enem.getX()-fire.getX()) <= 60 && enem.getSection() == fire.getSection()) {
          deathS.add(enem);
          deathF.add(fire);
          mario.changeScore(100);
          enemSpawnTimer = 50;
        }
      }
    }
  }
  // enemy vs main character detection
  for (spikey_enemy enem : spikeys) {
    if (abs(enem.getX()-mario.getX()) <= 60 && abs(enem.getY()-mario.getY()) <= 30 && wait <= 0 && !mario.getDeath()) {
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
  if (mario.getX() > 800-mario.getSizeX()) {
    mario.setXVel(-5);
  }
  if (mario.getX() < 0) {
    mario.setXVel(5);
  }
}

void resetter() {
  //mario.locktimer();
  //mario.invincibletimer();
  //mario.unlock();
  //mario.invincibleOff();
}