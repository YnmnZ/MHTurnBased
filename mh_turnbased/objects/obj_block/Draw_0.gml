if(moveable){
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_lime,1);
}else if(target){
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_red,1);
}else{
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,1);
}

