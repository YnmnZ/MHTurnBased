if(mouse_check_button_pressed(mb_left)){
	
	if(b_type == "Skill"){
			
		remove_ghost_trap()
		obj_block.moveable = false;
		
		if(display_text=="Attack"){
			remove_all_but_menu()
		}else{
			remove_all_but_menu(2)
		}
		
		if(display_text == "Fade Slash"){
			remove_ghost_trap();
			
			obj_block.moveable = false;
			
			var button = instance_create_depth(obj_manager.starting_x +2*180 + 20,room_height/2+150 + 80 * 0,-2,obj_button);
			button.display_text = "Up";
			button.level = 3;
			button.b_type = "Skill";
			
			button = instance_create_depth(obj_manager.starting_x +2*180 + 20,room_height/2+150 + 80 * 1,-2,obj_button);
			button.display_text = "Down";
			button.level = 3;
			button.b_type = "Skill";
		}else{		
			for(var i = 0; i < array_length(obj_enemy.body_part); i++){
			
			
				if(display_text=="Attack"){
					var button = instance_create_depth(obj_manager.starting_x +180 + 10,room_height/2+150 + 80 * i,-2,obj_button);
					button.display_text = obj_enemy.body_part[i][0];
					button.level = 2;
				}else if (display_text = "Up" || display_text = "Down"){
					var button = instance_create_depth(obj_manager.starting_x +3*180 + 30,room_height/2+150 + 80 * i,-2,obj_button);
					button.display_text = obj_enemy.body_part[i][0];
					button.level = 4;
				}
				else{
					var button = instance_create_depth(obj_manager.starting_x +2*180 + 20,room_height/2+150 + 80 * i,-2,obj_button);
					button.display_text = obj_enemy.body_part[i][0];
					button.level = 3;
				}
			}
		}
			
		obj_manager.selected_skill = display_text;

	}
	
	switch(display_text){
		
		case "Unsheath":
		
			obj_manager.player_unsheath = true;
			instance_destroy(obj_button);
			obj_manager.state = "player turn";
			
			enemy_skill_target(obj_manager.enemy_skill,obj_manager.block_array);
			
			if(instance_exists(obj_trap)){
				obj_trap.life --;
				with(obj_trap){
					if(life == 0){
						instance_destroy();
					}
				}
			}
		
			if(instance_exists(obj_moon)){
				obj_moon.life --;
				with(obj_moon){
					if(life == 0){
						instance_destroy();
					}
				}
			}
			
			break;
			
		case "Sheath":
			
			obj_manager.player_unsheath = false;
			instance_destroy(obj_button);
			obj_manager.state = "player turn";
			
			enemy_skill_target(obj_manager.enemy_skill,obj_manager.block_array);
			
			if(instance_exists(obj_trap)){
				obj_trap.life --;
				with(obj_trap){
					if(life == 0){
						instance_destroy();
					}
				}
			}
		
			if(instance_exists(obj_moon)){
				obj_moon.life --;
				with(obj_moon){
					if(life == 0){
						instance_destroy();
					}
				}
			}
			
			break;
		
		case "Use Item":
			remove_ghost_trap();
			remove_all_but_menu();
			obj_block.moveable = false;
			for(var i = 0;i<array_length(obj_manager.player_inventory);i++){
				var button = instance_create_depth(obj_manager.starting_x +180 + 10,room_height/2+150 + 80 * i,-2,obj_button);
				button.display_text = obj_manager.player_inventory[i][0];
				button.display_number = obj_manager.player_inventory[i][1];
				button.level = 2;
				button.b_type = "item";
				button.index = i;
			}
			break;
		
		case "Skill":
			remove_ghost_trap()
			remove_all_but_menu();
			obj_block.moveable = false;
			for(var i = 0;i<array_length(obj_manager.player_skill);i++){
				var button = instance_create_depth(obj_manager.starting_x +180 + 10,room_height/2+150 + 65 * i,-2,obj_button);
				button.display_text = obj_manager.player_skill[i][0];
				button.display_number = obj_manager.player_skill[i][1];
				button.level = 2;
				button.b_type = "Skill";
				button.index = i;
			}
			break;
		
		case "Potion":
			
			if(display_number>0){
				remove_ghost_trap()
				obj_manager.player_hp += 5;
				obj_manager.player_hp = min(obj_manager.player_hp,obj_manager.player_max_hp);
				obj_manager.action_point--;
				//display_number--;
				obj_manager.player_inventory[0][1]--;
				
			}
			
			break;
		
		case "Serene Pose":
		
			if(obj_manager.skill_cooldown[4] = 0){
				remove_ghost_trap()
				remove_all_but_menu();
			
				instance_destroy(obj_stance);
				instance_create_depth(obj_player.x,obj_player.y,-5,obj_stance);
				obj_manager.action_point--;
				obj_manager.stance = true;
				
				obj_manager.skill_cooldown[4] = obj_manager.player_skill[4][2]
			}else{
				remove_ghost_trap()
				remove_all_but_menu();
				var in_cd = instance_create_depth(room_width/2,room_height/2,-3,obj_temp_text);
				in_cd.display_text = "In Cooldown! Available in " + string(obj_manager.skill_cooldown[4]) + " turns.";
			}
			
			break;
		
		case "Harvest Moon":
		
			if(obj_manager.skill_cooldown[5] = 0){
				remove_ghost_trap()
				remove_all_but_menu();
			
				instance_destroy(obj_moon);
				
				for(var i = 0; i<array_length(obj_manager.block_array);i++){
					var block_check = obj_manager.block_array[i];
					var distance_between = abs(block_check.grid_x - obj_player.grid_x) + abs(block_check.grid_y - obj_player.grid_y);
		
					if(distance_between <= 1){
						instance_create_depth(block_check.x,block_check.y,-1,obj_moon);
					}
				}
				
				obj_manager.action_point--;
				
				obj_manager.skill_cooldown[5] = obj_manager.player_skill[5][2]
			}else{
				remove_ghost_trap()
				remove_all_but_menu();
				var in_cd = instance_create_depth(room_width/2,room_height/2,-3,obj_temp_text);
				in_cd.display_text = "In Cooldown! Available in " + string(obj_manager.skill_cooldown[4]) + " turns.";
			}
			
			break;
		
		case "Sp Sheath":
		

			remove_ghost_trap()
			remove_all_but_menu();
			
			obj_manager.sp_sheathe = true;
			
			obj_manager.action_point--;

			turn_end();
			
			break;
		
		case "Antidote":
			
			if(display_number>0 && obj_manager.player_state[0][1] > 0){
				remove_ghost_trap()
				obj_manager.player_state[0][1] = 0;
				obj_manager.action_point--;
				//display_number--;
				obj_manager.player_inventory[1][1]--;
				
			}
			
			break;
		
		case "Trap":
			
			if(display_number>0){
				remove_ghost_trap()
				for(var i = 0; i<array_length(obj_manager.block_array);i++){
					var block_check = obj_manager.block_array[i];
					var distance_between = abs(block_check.grid_x - obj_player.grid_x) + abs(block_check.grid_y - obj_player.grid_y);
		
					if(distance_between <= 1 && distance_between != 0){
						var trap = instance_create_depth(obj_manager.starting_x+block_check.grid_x * 160,obj_manager.starting_y+block_check.grid_y * 160,-1,obj_trap);
						trap.grid_x = block_check.grid_x;
						trap.grid_y = block_check.grid_y;
					}
		
				}
				
			}
			
			break;
		
		case "Flash":
			
			if(display_number>0 && obj_enemy.flying){
				remove_ghost_trap()
				
				obj_manager.action_point += 3;
				obj_manager.action_point--;
				//display_number--;
				obj_manager.player_inventory[1][1]--;
				obj_enemy.flying = false;
				with(obj_manager){
					enemy_skill = select_enemy_skill(obj_enemy.flying,obj_enemy.skill_array,obj_enemy.body_part_array);
					skill_user = obj_enemy.body_part_array[enemy_skill[8]]
					enemy_refresh = true;
					instance_create_depth(skill_user.x-70,skill_user.y,0,obj_hint);
					//show_debug_message(enemy_skill);
				}
				
			}
			
			break;
		
		case "Move":
			remove_ghost_trap()
			var unsheath = obj_manager.player_unsheath;
			var move_distance = 0;
			
			if(unsheath){
				move_distance = 1;
			}else{
				move_distance = 2;
			}
			
			determine_moveable(move_distance,obj_player.grid_x,obj_player.grid_y);
			
			remove_all_but_menu();
			
			break;
			
		case "Switch":
			remove_ghost_trap()
			obj_block.moveable = false;
			obj_manager.action_point --;
			
			obj_manager.player_unsheath = !obj_manager.player_unsheath;
			instance_destroy(obj_button);
			obj_manager.button_gen = false;
			remove_all_but_menu();
			
			break;
		
		case "Head":
			
			remove_ghost_trap()
			obj_block.moveable = false;
			if(obj_enemy.flying && obj_manager.selected_skill!="Soaring Kick"){
				var fly_hint = instance_create_depth(room_width/2,room_height/2,-3,obj_temp_text);
				fly_hint.display_text = "Cannot reach the part.";
			}else{
				attack(obj_manager.selected_skill,"Head");
			}
			
			break;
		
		case "Wings":
			
			remove_ghost_trap()
			obj_block.moveable = false;
			if(obj_enemy.flying && obj_manager.selected_skill!="Soaring Kick"){
				var fly_hint = instance_create_depth(room_width/2,room_height/2,-3,obj_temp_text);
				fly_hint.display_text = "Cannot reach the part.";
			}else{
				attack(obj_manager.selected_skill,"Wings");
			}
			
			break;
			
		case "Legs":
			
			remove_ghost_trap()
			obj_block.moveable = false;
			attack(obj_manager.selected_skill,"Legs");
			
			break;
		
		case "Tail":
			
			remove_ghost_trap()
			obj_block.moveable = false;
			if(obj_enemy.flying && obj_manager.selected_skill!="Soaring Kick"){
				var fly_hint = instance_create_depth(room_width/2,room_height/2,-3,obj_temp_text);
				fly_hint.display_text = "Cannot reach the part.";
			}else{
				attack(obj_manager.selected_skill,"Tail");
			}
			
			break;
		
		case "Turn End":
			
			turn_end();
			
			break;
	}
	
}