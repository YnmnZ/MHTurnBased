image_speed = 0;

if(part_hitpoint<= 0){
	if(part_hitpoint<0){
		part_hitpoint = 0;
	}
	if(part_name == "Head" && obj_enemy.flying && !broken){
		obj_manager.action_point+=5;
		obj_enemy.flying = false;
	}
	
	broken = true;
	damage_status = 3;
}else if (part_hitpoint <= part_max_hitpoint * 0.3){
	damage_status = 2;
}else if (part_hitpoint <= part_max_hitpoint * 0.6){
	damage_status = 1;
}else{
	damage_status = 0;
}

image_index = damage_status;