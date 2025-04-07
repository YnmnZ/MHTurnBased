// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_skill_target(skill,block_list){
	
	obj_block.target = false;
	
	var skill_name = skill[0];
	var target = skill[1];
	
	var target_x = 0;
	var target_y = 0;
	var temp_check = false;
	var temp_counter = 0;
	
	switch(skill_name){
		
		case "Fireball":

			while(temp_counter < 3){
				target_x = irandom(2);
				target_y = irandom(2);
			
				for(var i = 0; i < array_length(block_list); i++){
					var check_block = block_list[i];
					if(check_block.grid_x == target_x && check_block.grid_y == target_y){
						if(!check_block.target){
							check_block.target = true;
							temp_counter++;
							//show_debug_message("x:" + string(target_x));
							//show_debug_message("y:" + string(target_y))
						}
					}
				}
			}
			
			
			break;
		
		case "Charged Fireball":
			
			target_x = obj_player.grid_x;
			target_y = obj_player.grid_y;
			
			for(var i = 0; i < array_length(block_list); i++){
				var check_block = block_list[i];
				if(abs(check_block.grid_x - target_x)+abs(check_block.grid_y - target_y) <= 1){
					check_block.target = true;
				}
			}
			
			
			break;
			
		case "Bite":
			
			target_x = 2;
			target_y = irandom(2);
			
			for(var i = 0; i < array_length(block_list); i++){
				var check_block = block_list[i];
				if(check_block.grid_x == target_x && check_block.grid_y != target_y){
					check_block.target = true;
				}
			}
			
			
			break;
		
		case "Land":
			
			break;
		
		case "Take Off":
			
			break;
		
		case "Dash":
			target_y = irandom(2);
			
			for(var i = 0; i < array_length(block_list); i++){
				var check_block = block_list[i];
				if(check_block.grid_y == target_y){
					if(!check_block.target){
						check_block.target = true;
					}
				}
			}
			
			if(target_y == 0 || target_y == 2){
				target_y = 1;
			}else{
				target_y += choose(1,-1);
			}
			
			for(var i = 0; i < array_length(block_list); i++){
				var check_block = block_list[i];
				if(check_block.grid_y == target_y){
					if(!check_block.target){
						check_block.target = true;
					}
				}
			}
			
			break;
		
		case "Dive":
		
			target_x = obj_player.grid_x;
			target_y = obj_player.grid_y;
			
			for(var i = 0; i < array_length(block_list); i++){
				var check_block = block_list[i];
				if(check_block.grid_x == target_x && check_block.grid_y == target_y){
					if(!check_block.target){
						check_block.target = true;
					}
				}
			}
			
			if(target_y == 0 || target_y == 2){
				target_y = 1;
			}else{
				target_y += choose(1,-1);
			}
			
			for(var i = 0; i < array_length(block_list); i++){
				var check_block = block_list[i];
				if(check_block.grid_x == target_x && check_block.grid_y == target_y){
					if(!check_block.target){
						check_block.target = true;
					}
				}
			}
			
			break;
		
		case "Sweep":
			target_x = obj_player.grid_x;
			for(var i = 0; i < array_length(block_list); i++){
				var check_block = block_list[i];
				if(check_block.grid_x == target_x){
					if(!check_block.target){
						check_block.target = true;
					}
				}
			}
			break;
			
		case "Sweep Take Off":
			target_y = obj_player.grid_y;
			for(var i = 0; i < array_length(block_list); i++){
				var check_block = block_list[i];
				if(check_block.grid_y == target_y){
					if(!check_block.target){
						check_block.target = true;
					}
				}
			}
			break;
		
	}
	
}