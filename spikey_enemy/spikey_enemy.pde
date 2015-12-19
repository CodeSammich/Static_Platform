class spikey_enemy extends character_base{
  String frameleft = "spikey.png";
  String frameright = "spikey2.png";
  boolean is_enemy;
  spikey_enemy(int conlives, float conjump_height, boolean concan_jump, boolean concan_attack, boolean concan_move, float conarmor, float conresistance){
  super(conlives,conjump_height,concan_jump,concan_attack,concan_move,conarmor,conresistance);
  is_enemy=true;
  conlives=1;
  conjump_height=1;
  concan_move=true;
  concan_jump=false;
  concan_attack=true;
  conarmor=0;
  conresistance=0;
  }
}
