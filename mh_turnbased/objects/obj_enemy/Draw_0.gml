draw_self();
draw_set_font(fnt_text_large)
if(!global.hide){
	draw_text_color(x,y+200,hitpoint,c_white,c_white,c_white,c_white,1)
}
if(flying){
	
	draw_text_color(x,y-300,"Flying",c_white,c_white,c_white,c_white,1)
	
}
if(array_length(obj_manager.enemy_skill)>0){
	
	draw_text_color(x-50,y-230,"Next Skill: " + obj_manager.enemy_skill[0],c_white,c_white,c_white,c_white,1)
	
}
draw_set_font(fnt_text)