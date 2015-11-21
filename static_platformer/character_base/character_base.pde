class character_base {
  boolean is_godmode;
  boolean is_boss;
  boolean is_enemy;
  boolean can_jump;
  boolean can_move;
  boolean can_attack;
  int lives;
  float armor;
  float resistance;
  float health;
  float jump_height;
  String name;
    character_base(int conlives, float conjump_height, boolean concan_jump){
    conlives=lives;
    conjump_height=jump_height;
  }
  void spawn() {
  }
  void death() {
  }
  void update() {
  }
  void display() {
  }
}

