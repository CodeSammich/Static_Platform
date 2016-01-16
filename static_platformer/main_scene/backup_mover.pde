/*BRAINSTORM !!!
 SO, WHAT DO i NEED TO DO
 start with a character
 get input keys
 use inputs to move and do stuff
 and thats all for now
 .........................................................
 BINDS!!!
 we'll use WASDQE
 now, to bind keys
 W, JUMP 
 A, LEFT
 S, FALL
 D, RIGHT
 Q, MELEE ATTACK
 E, RANGED ATTACK
 ........................................................
 VARIABLES!!!!!
 vars for directions
 vars for attacks
 vars for speeds
 ........................................................
 we need a thing to move though, but that's ilan's job to create characters.
 */
class backup_mover {
  boolean left;
  boolean right;
  boolean jump;
  boolean crouch;
  boolean lrLock;
  float charSpeed;
  float X;
  float Y;
  float VX;
  float VY;
  float G;
  float jumpPower;
  //WHERE TO MOVE
  //LEFT
  void moveorsomething () {
    fill(#bada55);
    charSpeed=2;
    G=0.2;
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT) {
          left = true;
        } else if (keyCode != LEFT) {
          left = false;
        }
      }
    }
    //RIGHT
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == RIGHT) {
          right = true;
        } else if (keyCode != RIGHT) {
          right = false;
        }
      }
    }
    //JUMP
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) {
          jump = true;
        } else {
          jump = false;
        }
      }
    }
    //CROUCH
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == DOWN) {
          crouch = true;
        } else {
          crouch = false;
        }
      }
    }
    if (left == true) {
      VX=charSpeed;
      X=X-VX;
      println(VX);
      println("LEFT");
    } else if (left == false) {
      VX=0;
    }
    if (right == true) {
      VX=charSpeed*-1;
      X=X-VX;
      println(VX);
      println("RIGHT");
    } else if (right == false) {
      VX=0;
    }
    if (jump == true ) {
      println("UP");
      //DDDDDDOOOOOOOO TTTTHHHEEEEEE JJUUUUMMMMMPPPPPP
      VY=VY-G;
      Y=Y-VY;
    } else if (jump == false) {
      jumpPower=10;
      VY=jumpPower;
    }
    if (crouch == true) {
      println("DOWN");
      //DDDDDDOOOOOOOOO TTTHTHHHEEEEEEE CCRRRRROOOUUUUCCCCHHHHHH
    }
  }
}
//GRAVITY
//class jump {
//if (boolean jump == true) {

