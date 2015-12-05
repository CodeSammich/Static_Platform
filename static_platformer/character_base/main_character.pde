class main_character extends character_base {
  boolean is_player;
  main_character(int conlives, float conjump_height, boolean concan_jump, boolean concan_attack, boolean concan_move, float conarmor, float conresistance){
  super(conlives,conjump_height,concan_jump,concan_attack,concan_move,conarmor,conresistance);
  is_player=true;
  conlives=3;
  conjump_height=5;
  concan_move=true;
  concan_jump=true;
  concan_attack=true;
  conarmor=10;
  conresistance=7;
  }
}
