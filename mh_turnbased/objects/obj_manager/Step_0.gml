switch(state){
	case "initial":
		
		instance_create_depth(mouse_x,mouse_y,-10,obj_cursor)
		
		for(var i = 0; i<ds_grid_width(player_grid);i++){
			for(var j = 0;j<ds_grid_height(player_grid);j++){
				
				var block = instance_create_depth(starting_x + i*160,starting_y + j*160,0,obj_block)
				
				block.grid_x = i;
				block.grid_y = j;
				
				array_push(block_array,block);
				
			}
		}
		
		
		instance_create_depth(starting_x + 160,starting_y + 160,-1,obj_player);
		
		instance_create_depth(room_width - starting_x - 4*160, starting_y + 200,0,obj_enemy);
		
		state = "player choose state";
		break;
	
	case "player choose state":
	
		sp_sheathe = false;
		stance = false;
		counter_buff = false;
		
		if(enemy_refresh == false){
			enemy_skill = select_enemy_skill(obj_enemy.flying,obj_enemy.skill_array,obj_enemy.body_part_array);
			skill_user = obj_enemy.body_part_array[enemy_skill[8]]
			enemy_refresh = true;
			show_debug_message(skill_user)
			instance_create_depth(skill_user.x-70,skill_user.y,0,obj_hint);
		}
		
		if(instance_exists(obj_stance)){
			instance_destroy(obj_stance);
		}
		
		if(!instance_exists(obj_button)){
			for(var i = 0;i<2;i++){
			
				var button = instance_create_depth(room_width/2-250+500*i,room_height/2+300,-2,obj_button);
				var button_text = ["Unsheath","Sheath"];
			
				button.display_text = button_text[i];
			
			}
		}
		
		break;
		
	case "player turn":
		
		if(keyboard_check_pressed(vk_escape)){
			
			obj_block.moveable = false;
			
			remove_all_but_menu();
			
			//show_debug_message(string(button_max_level))
			
		}
		
		if(!button_gen){
			
			if(player_unsheath){
				
				//拔刀
				for(var i = 0;i<array_length(player_action[0]);i++){
					var button = instance_create_depth(starting_x,room_height/2+150 + 80 * i,-2,obj_button);
					button.display_text = player_action[0][i];
					button.level = 1;
					if(button.display_text == "Attack"){
						button.b_type = "Skill";
					}
				}
				
			}else{
				
				//收刀
				for(var i = 0;i<array_length(player_action[1]);i++){
					var button = instance_create_depth(starting_x,room_height/2+150 + 80 * i,-2,obj_button);
					button.display_text = player_action[1][i];
					button.level = 1;
				}
				
			}
			
			button_gen = true;
			
		}
		
		if(action_point <= 0){
			turn_end();
		}
		
		break;
	
	case "enemy turn":
		
		enemy_damage = enemy_skill[2];
		enemy_action_grant = enemy_skill[3];
		
		if(enemy_skill[0] == "Land"){
			var wing = obj_enemy.body_part_array[1];
			if(wing.broken){
				enemy_action_grant += 1;
			}
		}
		
		if(enemy_skill[0] == "Dive"){
			var legs = obj_enemy.body_part_array[2];
			if(legs.broken){
				enemy_action_grant += 1;
			}
		}
		
		break;
		
	case "enemy turn end":
		
		if(enemy_skill[0] == "Land" || enemy_skill[0] == "Dive"){
			obj_enemy.flying = false;
		}
		if(enemy_skill[0] == "Take Off" || enemy_skill[0] == "Sweep Take Off"){
			obj_enemy.flying = true;
		}
		
		if(enemy_skill[0] == "Fireball" && attacked && !parry){
			obj_manager.player_state[1][1]++;
		}
		
		if(enemy_skill[0] == "Charged Fireball" && attacked && !parry){
			obj_manager.player_state[1][1]+=2;
		}
		
		if(enemy_skill[0] == "Sweep" && attacked && !parry){
			var tail = obj_enemy.body_part_array[3];
			if(!tail.broken){
				obj_manager.player_state[0][1]+=2;
			}
		}
		
		if(enemy_skill[0] == "Sweep Take Off" && attacked && !parry){
			var tail = obj_enemy.body_part_array[3];
			if(!tail.broken){
				obj_manager.player_state[0][1]++;
			}
		}
		
		action_point = min(action_point,action_point_herit_max);
		action_point += enemy_action_grant;
		obj_block.target = false;
		enemy_skill = [];
		skill_user = noone;
		enemy_refresh = false;
		state = "player choose state";
		break;
	
	case "end":
		
		break;
	
}

if(player_hp<=0){
	state = "end";
	room_goto(rm_lose)
	global.hide = true;
}

if(obj_enemy.hitpoint<=0){
	state = "end";
	room_goto(rm_win)
	global.hide = true;
}