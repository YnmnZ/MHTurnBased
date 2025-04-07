state = "initial";

randomize();

starting_x = 200;
starting_y = 160;

action_point = 4;
action_point_herit_max = 2;
player_max_hp = 10;
player_hp = player_max_hp;

//player_state[0][1] = 0;//player_state[0][1]
//player_state[1][1] = 0;//player_state[1][1]
sp_sheathe = false;
stance = false;
player_state = [["Poison",0],["Burn",0]]
counter_buff = false;

player_unsheath = true;

selected_skill = "";
attack_list = [["Attack",3,1],["Up",2,1],["Down",2,1],["Spirit Blade",3,1],["Soaring Kick",10,2],["Foresight",2,0],["Sheath",5,0],["Moon",3,0]]
spirit_counter = 0;
spirit_point = 0;
spirit_point_max = 5;
spirit_level = 0;

button_max_level = 0;
button_gen = false;

enemy_action_grant = 2;

player_action = [["Attack","Skill","Move","Switch","Turn End"],["Use Item","Move","Switch","Turn End"]];
block_array = [];

player_grid = ds_grid_create(3,3);
player_inventory = [["Potion",3],["Antidote",3],["Trap",1],["Flash",2]];//0:potion,1:antidote,2:trap,3:flash
player_skill = [["Fade Slash",1,-1],["Spirit Blade",1,-1],["Sp Sheath",1,-1],["Soaring Kick",2,1],["Serene Pose",1,2],["Harvest Moon",1,3]]
skill_cooldown = [-1,-1,-1,0,0,0]

enemy_skill = [];
skill_user = noone;
enemy_refresh = false;
enemy_damage = 0;
attacked = false;
parry = false;