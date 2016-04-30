class projectile_firebolt {
  String frameL1="Images/fireball1.png";
  String frameL2="Images/fireball2.png";
  String frameR1="Images/fireball3.png";
  String frameR2="Images/fireball4.png";
  int frameswitch=1;
  PImage img1;
  PImage img2;
  PImage img3;
  PImage img4;
  String name;
  boolean is_projectile;
  boolean player_proj;
  int speed;
  int damage;
  int direction;
  int x;
  int y;
  int section;
  int sizeX;
  int sizeY;
  projectile_firebolt(int condirection, int conspawnx, int conspawny) {
    is_projectile = true;
    player_proj = true;
    damage = 1;
    direction = condirection;
    speed = 3;
    name = "firebolt";
    x = conspawnx;
    y = conspawny;
    sizeX=40;
    sizeY=30;
    img1 = loadImage(frameL1);
    img2 = loadImage(frameL2);
    img3 = loadImage(frameR1);
    img4 = loadImage(frameR2);
    updateSection();
  }

  void display() {
    if (frameCount%25 == 0) frameswitch = frameswitch *-1;
    if (direction == 1) {
      if (frameswitch == 1) image(img3, x, y, sizeX, sizeY);
      else image(img4, x, y, sizeX, sizeY);
    }
    if (direction == -1) {
      if (frameswitch == 1) image(img1, x, y, sizeX, sizeY);
      else image(img2, x, y, sizeX, sizeY);
    }
    x += speed * direction;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  void halt() {
    speed = 0;
  }

  int getSection() {
    return section;
  }
  void setSection(int change) {
    section = change;
  }
  void updateSection() {
    if (y < 0 && y >= height-sizeY) setSection(0);
    if (y < height-sizeY && y >= 425) setSection(1);
    if (y < 425 && y >= 425-sizeY) setSection(2);
    if (y < 425-sizeY && y >= 325) setSection(3);
    if (y < 325 && y >= 325-sizeY) setSection(4);
    if (y < 325-sizeY && y >= 325-2*sizeY) setSection(5);
    if (y < 325-2*sizeY && y >= 325-3*sizeY) setSection(6);
    if (y < 325-3*sizeY && y >= 325-4*sizeY) setSection(7);
  }
}

