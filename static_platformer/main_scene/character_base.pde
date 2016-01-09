class character_base {
  boolean is_godmode;
  boolean is_boss;
  boolean is_enemy;
  boolean can_jump;
  boolean can_move;
  boolean can_spawn;
  boolean can_attack;
  float damagedeal;
  int lives;
  float armor;
  float resistance;
  float health;
  float jump_height;
  String name;
  character_base(float condamagedeal, String conname, float conhealth, int conlives, float conjump_height, boolean concan_jump, boolean concan_attack,boolean concan_spawn, boolean concan_move, float conarmor, float conresistance) {
    lives=conlives;
    health=conhealth;
    jump_height=conjump_height;
    armor=conarmor;
    resistance=conresistance;
    name=conname;
    damagedeal=condamagedeal;
  }
  /* void ishumanplayer{
   while(initialization_isDone=false) {
   */
  void spawn() {
  }
  void death() {
  }
  void update() {
  }
  void display() {
  }
}

