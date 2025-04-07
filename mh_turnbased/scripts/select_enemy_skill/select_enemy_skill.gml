function select_enemy_skill(flying,skill_list,body_list){
	
	instance_destroy(obj_hint);
	
	var available_skill = [];
	
	for(var i = 0; i<array_length(skill_list);i++){
		
		var check_skill = skill_list[i];
		var skill_required_state = check_skill[7];
		var skill_proportion = check_skill[4];
		
		if(skill_required_state == -1){
			
			
			repeat(skill_proportion){
				array_push(available_skill,check_skill);
			}
		}else{
			if(skill_required_state == flying){
				
				if(check_skill[0] == "Land"){
					var wing = obj_enemy.body_part_array[1];
					if(wing.broken){
						skill_proportion += 2;
					}
				}
				
				repeat(skill_proportion){
					array_push(available_skill,check_skill);
				}
			}
		}
		
	}
	
	available_skill = array_shuffle(available_skill);
	
	//var part_index = available_skill[7];
	//show_debug_message(part_index)
	//var part = obj_enemy.body_part_array[1]
	//instance_create_depth(part.x-100,part.y,0,obj_hint)
	
	//show_debug_message("Casting!")
	//show_debug_message(available_skill[0][0])
	return available_skill[0];
	
}