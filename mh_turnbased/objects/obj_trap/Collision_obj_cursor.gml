if(mouse_check_button_pressed(mb_left)){
	state = "solid";
	obj_manager.action_point--;
	//display_number--;
	obj_manager.player_inventory[2][1]--;
	remove_ghost_trap();
}