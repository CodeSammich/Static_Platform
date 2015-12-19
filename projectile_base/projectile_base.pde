class projectile_base{
  boolean hit;
  int damage;
  int direction;
  float speed;
  String name;
  String spritename;
  projectile_base(int condamage, int condirection, float conspeed, String conname, String conspritename){
    damage = condamage;
    direction = condirection;
    speed = conspeed;
    name = conname;
    spritename = conspritename;
  }
  
  void spawn(){
  }
  void touch(){
  }
  void update(){
  }
  void display(){
  }
}
