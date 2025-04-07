draw_self();
draw_set_font(fnt_text_large)
draw_text_color(x+sprite_width+20,y,part_name,c_white,c_white,c_white,c_white,1);
if(!global.hide){
	draw_text_color(x+sprite_width+150,y,string(part_hitpoint),c_white,c_white,c_white,c_white,1);
}
draw_set_font(fnt_text)

