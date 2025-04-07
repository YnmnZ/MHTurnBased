if(moveable && mouse_check_button_pressed(mb_left)){
	obj_manager.action_point --;
	obj_player.grid_x = grid_x;
	obj_player.grid_y = grid_y;
	
	if(obj_manager.player_state[1][1]>0){
		obj_manager.player_state[1][1]--;
	}
	
	if(instance_exists(obj_moon)){
		if(!instance_place(x,y,obj_moon)){
			instance_destroy(obj_moon);
		}
	}
	
	with(obj_player){
		set_location(grid_x,grid_y)
	}
	obj_block.moveable = false;
}