if(mouse_check_button_pressed(mb_left)){
	global.hide = -global.hide;
	if(image_index == 0){
		image_index = 1;
	}else{
		image_index = 0;
	}
}