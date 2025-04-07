
if(x>obj_qte_bar.right){
	x=obj_qte_bar.right
	h_speed = -h_speed;
}

if(x <= obj_qte_bar.left){
	x=obj_qte_bar.left
	h_speed = -h_speed;
}

x+=h_speed;

if(obj_manager.sp_sheathe){
	if(keyboard_check_pressed(vk_space)){
		obj_manager.action_point --;
		if(instance_place(x,y,obj_qte_success)){
			obj_manager.parry = true;
		
			obj_manager.spirit_level = min(3,obj_manager.spirit_level+1);
		
			show_debug_message("check");
			var temp_text = instance_create_depth(room_width/2,room_height/2,-5,obj_temp_text);
			temp_text.display_text = "Iai Slash Success!";
			attack("Sheath",obj_enemy.body_part[obj_manager.enemy_skill[8]][0])
			
			if(instance_exists(obj_moon)){
				attack("Moon",obj_enemy.body_part[obj_manager.enemy_skill[8]][0])
			}
			
		}else{
			
			show_debug_message("check fail");
			var temp_text = instance_create_depth(room_width/2,room_height/2,-5,obj_temp_text);
			temp_text.display_text = "Iai Slash Failed!";
			
		}
		h_speed = 0;
	}
}else{
	
	if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))){
		h_speed = 0;
		obj_manager.action_point --;
		if(instance_place(x,y,obj_qte_success)){
			if(obj_player.grid_y>=1){
				if(obj_manager.player_state[1][1]>0){
					obj_manager.player_state[1][1]--;
				}
				obj_player.grid_y--;
				with(obj_player){
					set_location(grid_x,grid_y)
				}
			}
		
			for(var i = 0; i<array_length(obj_manager.block_array);i++){
			var check_block = obj_manager.block_array[i];
			if(check_block.grid_x == obj_player.grid_x && check_block.grid_y == obj_player.grid_y){
				if(check_block.target){
					show_debug_message("check fail");
					var temp_text = instance_create_depth(room_width/2,room_height/2,-5,obj_temp_text);
					temp_text.display_text = "Foresight Slash Failed!";
					h_speed = 0;
					obj_manager.parry = false;
				}else{
					show_debug_message("check");
					var temp_text = instance_create_depth(room_width/2,room_height/2,-5,obj_temp_text);
					temp_text.display_text = "Foresight Slash Success!";
					h_speed = 0;
					obj_manager.parry = true;
					obj_manager.counter_buff = true;
					obj_manager.spirit_point = min(obj_manager.spirit_point_max, obj_manager.spirit_point+3)
					attack("Foresight",obj_enemy.body_part[obj_manager.enemy_skill[8]][0])
					if(instance_exists(obj_moon)){
						attack("Moon",obj_enemy.body_part[obj_manager.enemy_skill[8]][0])
					}
					}
				}
			}
		}else{
			var temp_text = instance_create_depth(room_width/2,room_height/2,-5,obj_temp_text);
			temp_text.display_text = "Foresight Slash Failed!";
		}
		
	}
	if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))){
		h_speed = 0;
		obj_manager.action_point --;
		
		if(instance_place(x,y,obj_qte_success)){
			if(obj_player.grid_y<=1){
				if(obj_manager.player_state[1][1]>0){
					obj_manager.player_state[1][1]--;
				}
				obj_player.grid_y++;
				with(obj_player){
					set_location(grid_x,grid_y)
				}
			}
		
			for(var i = 0; i<array_length(obj_manager.block_array);i++){
			var check_block = obj_manager.block_array[i];
			if(check_block.grid_x == obj_player.grid_x && check_block.grid_y == obj_player.grid_y){
				if(check_block.target){
					show_debug_message("check fail");
					var temp_text = instance_create_depth(room_width/2,room_height/2,-5,obj_temp_text);
					temp_text.display_text = "Foresight Slash Failed!";
					h_speed = 0;
					obj_manager.parry = false;
				}else{
					show_debug_message("check");
					var temp_text = instance_create_depth(room_width/2,room_height/2,-5,obj_temp_text);
					temp_text.display_text = "Foresight Slash Success!";
					h_speed = 0;
					obj_manager.parry = true;
					obj_manager.counter_buff = true;
					obj_manager.spirit_point = min(obj_manager.spirit_point_max, obj_manager.spirit_point+3)
					attack("Foresight",obj_enemy.body_part[obj_manager.enemy_skill[8]][0])
					if(instance_exists(obj_moon)){
						attack("Moon",obj_enemy.body_part[obj_manager.enemy_skill[8]][0])
					}
					}
				}
			}
			
		}else{
			var temp_text = instance_create_depth(room_width/2,room_height/2,-5,obj_temp_text);
			temp_text.display_text = "Foresight Slash Failed!";
		}
	}
}