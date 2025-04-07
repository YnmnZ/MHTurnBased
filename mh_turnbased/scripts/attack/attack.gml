// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack(attack_type, target_part){
	show_debug_message(attack_type)
	var part = noone;
	for(var i = 0; i< array_length(obj_enemy.body_part_array); i++){
		var check_part = obj_enemy.body_part_array[i];
		if (check_part.part_name == target_part){
			part = check_part;
		}
	}
	
	var damage = 0;
	var action = 0;
	for(var i = 0; i< array_length(obj_manager.attack_list); i++){
		var check_attack = obj_manager.attack_list[i];
		show_debug_message(check_attack)
		if(check_attack[0] == attack_type){
			damage = check_attack[1];
			action = check_attack[2];
		}
	}
	
	if(obj_manager.counter_buff){
		damage ++;
	}
	
	show_debug_message(damage);
	show_debug_message(action)
	
	var can_attack = false;
	
	switch(attack_type){
		
		case "Attack":
			can_attack = true;
			
			break;
			
		case "Up":
			can_attack = true;
			break;

		case "Down":
			can_attack = true;
			break;
		
		case "Foresight":
			can_attack = true;
			break;
		
		case "Sheath":
			can_attack = true;
			break;
		
		case "Moon":
			can_attack = true;
			break;
		
		case "Spirit Blade":
			if(obj_manager.spirit_point>0){
				can_attack = true;
				obj_manager.spirit_point--
			}else{
				var not_enough_spirit = instance_create_depth(room_width/2,room_height/2,-3,obj_temp_text);
				not_enough_spirit.display_text = "Not Enough Spirit Point!"
			}
			break;
			
		case "Soaring Kick":
			if(obj_manager.spirit_level>0){
				can_attack = true;
			}else{
				var not_enough_spirit = instance_create_depth(room_width/2,room_height/2,-3,obj_temp_text);
				not_enough_spirit.display_text = "Not Enough Spirit Level!"
			}
			break;
	}
	
	if(obj_manager.action_point < action){
		can_attack = false;
		var not_enough_action = instance_create_depth(room_width/2,room_height/2,-3,obj_temp_text);
		not_enough_action.display_text = "Not Enough Action Point!"
	}
	show_debug_message(can_attack)
	
	if(can_attack){
		//show_debug_message("attack")
		
		switch(attack_type){
			case "Up":
				if(obj_player.grid_y>=1){
					obj_player.grid_y--;
					if(obj_manager.player_state[1][1]>0){
						obj_manager.player_state[1][1]--;
					}
					with(obj_player){
						set_location(grid_x,grid_y)
					}
				}
				break;
			case "Down":
				if(obj_player.grid_y<=1){
					obj_player.grid_y++;
					if(obj_manager.player_state[1][1]>0){
						obj_manager.player_state[1][1]--;
					}
					with(obj_player){
						set_location(grid_x,grid_y)
					}
				}
				break;
			case "Soaring Kick":
				if(obj_player.grid_x != 2){
					if(obj_manager.player_state[1][1]>0){
						obj_manager.player_state[1][1]--;
					}
					obj_player.grid_x = 2;
					with(obj_player){
						set_location(grid_x,grid_y)
					}
				}
				break;
		}
		
		if(attack_type == "Spirit Blade"){
			damage += obj_manager.spirit_counter*1;
			obj_manager.spirit_counter ++;
		}else{
			obj_manager.spirit_counter = 0;
			obj_manager.spirit_point = min(obj_manager.spirit_point+1,obj_manager.spirit_point_max)
		}
		
		if(attack_type == "Soaring Kick"){
			damage += obj_manager.spirit_level * 2;
		}
		
		damage *= (1+obj_manager.spirit_level * 0.2)
		damage = round(damage);
		part.part_hitpoint-=damage;
		obj_enemy.hitpoint-=damage;
		
		if(obj_manager.spirit_counter >= 3){
			obj_manager.spirit_counter = 0;
			obj_manager.spirit_level = min(3,obj_manager.spirit_level+1);
		}
		
		if(attack_type == "Soaring Kick"){
			obj_manager.spirit_level --;
		}
		
		if(attack_type == "Moon"){
			var temp_text = instance_create_depth(part.x+450,part.y,-3,obj_temp_text);
			temp_text.display_text = "- " + string(damage);
			temp_text.move = true;
		}else{
			var temp_text = instance_create_depth(part.x+350,part.y,-3,obj_temp_text);
			temp_text.display_text = "- " + string(damage);
			temp_text.move = true;
		}
		
		obj_manager.action_point-=action;
		remove_all_but_menu();
	}
	
}