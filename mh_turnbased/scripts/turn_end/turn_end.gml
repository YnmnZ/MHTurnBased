// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function turn_end(){
	remove_ghost_trap()
	obj_block.moveable = false;
	instance_destroy(obj_button);
	obj_manager.button_gen = false;
	obj_manager.parry = false;
	
	if(obj_manager.player_state[0][1]>0){
		
		obj_manager.player_hp-=obj_manager.player_state[0][1];
		var temp_text = instance_create_depth(300,room_height / 2 + 80,-1,obj_temp_text);
		temp_text.display_text = "Poison: - " + string(obj_manager.player_state[0][1]--);
		temp_text.move = true;
		obj_manager.player_state[0][1]--;
		
	}
	
	if(obj_manager.player_state[1][1]>0){
		obj_manager.player_hp-=obj_manager.player_state[1][1];
		var temp_text = instance_create_depth(300,room_height / 2 + 120,-1,obj_temp_text);
		temp_text.display_text = "Burn: - " + string(obj_manager.player_state[1][1]--);
		temp_text.move = true;
	}
	
	for(var i = 0; i < array_length(obj_manager.skill_cooldown);i++){
		if(obj_manager.skill_cooldown[i]>0){
			obj_manager.skill_cooldown[i]--;
		}
	}
	
	obj_manager.state = "enemy turn";
	
	for(var i = 0; i<array_length(obj_manager.block_array);i++){
		var check_block = obj_manager.block_array[i];
		if(check_block.grid_x == obj_player.grid_x && check_block.grid_y == obj_player.grid_y){
			if(check_block.target){
				obj_manager.attacked = true;
				with(obj_manager){
					if(action_point>=1){
						var bar = instance_create_depth(room_width / 2, 650, -2,obj_qte_bar);
						var success = instance_create_depth(room_width / 2 - 250 + irandom(500),650,-3,obj_qte_success);
						var control = instance_create_depth(room_width/2,650,-4,obj_qte_control);
						alarm_set(0,180);
					}else{
						alarm_set(0,60);
					}
				}
			}else{
				obj_manager.attacked = false;
				with(obj_manager){
					alarm_set(1,60);
				}
			}
		}
	}
}