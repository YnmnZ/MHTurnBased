draw_self();
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


if(b_type == "item"){
	draw_set_halign(fa_left);
	draw_text(x-70,y,display_text);
	draw_text(x+45,y,string(display_number))
}else{
	draw_text(x,y,display_text);
}

