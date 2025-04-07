// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function determine_moveable(distance,grid_x,grid_y){
	for(var i = 0; i<array_length(obj_manager.block_array);i++){
		var block_check = obj_manager.block_array[i];
		var distance_between = abs(block_check.grid_x - grid_x) + abs(block_check.grid_y - grid_y);
		
		if(distance_between <= distance && distance_between!=0){
			block_check.moveable = true;
		}
		
	}
}