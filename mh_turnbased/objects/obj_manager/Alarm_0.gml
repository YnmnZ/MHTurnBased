/// @description enemy_attack_timer

if(!parry){
	player_hp -= enemy_damage;
	
	var temp_text = instance_create_depth(100,room_height / 2 + 80,-1,obj_temp_text);
	temp_text.display_text = "- " + string(enemy_damage);
	temp_text.move = true;
	
	
	if(enemy_skill[0] == "Dash"){
		obj_player.grid_x = 0;
		with(obj_player){
			set_location(grid_x,grid_y)
		}
	}
	
}

with(obj_trap){
	show_debug_message("trigger")
	if(instance_place(x,y,obj_block)){
		
		var check_block = instance_place(x,y,obj_block);
		if(check_block.target){
			var temp_text = instance_create_depth(check_block.x,check_block.y,-1,obj_temp_text);
			temp_text.display_text = "Triggered!";
			temp_text.move = true;
			instance_destroy();
			obj_manager.action_point+= 3;
			obj_enemy.flying = false;
			with(obj_manager){
				enemy_skill = select_enemy_skill(obj_enemy.flying,obj_enemy.skill_array,obj_enemy.body_part_array);
				skill_user = obj_enemy.body_part_array[enemy_skill[8]]
				enemy_refresh = true;
				instance_create_depth(skill_user.x-70,skill_user.y,0,obj_hint);
				//show_debug_message(enemy_skill);
			}
		}
	}else{
		instance_destroy()
	}
}

instance_destroy(obj_qte_bar);
instance_destroy(obj_qte_control);
instance_destroy(obj_qte_success);

state = "enemy turn end";