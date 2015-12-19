class projectile_firebolt{
  boolean is_projectile;
  boolean player_proj;
  firebolt(int condamage, int condirection, float conspeed, String conname, String conspritename){
    super(condamage, condirection, conspeed, conname, conspritename)
    is_projectile = true;
    player_proj = true;
    condamage = 1;
    condirection = /* depends on player direction */ 1;
    conspeed = 1;
    conname = "firebolt";
    conspritename = /* depends on asset */ "placeholder";
  }
}
