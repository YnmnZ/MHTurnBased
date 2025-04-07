if(instance_place(x,y,obj_cursor)){
	var tip = ""
	switch(part_name){
		case "Head":
			tip = "Break when Flying: \nEnd Flyig state immediately; \nGain 5 Action Points"
			break;
		
		case "Wings":
			tip = "Break: \nLand More Frequently; \nLand gives 1 more Action Point"
			break;
	
		case "Legs":
			tip = "Break: \nDive gives 1 more Action Point"
			break;
	
		case "Tail":
			tip = "Break: \nNo Longer Inflict Poison"
			break;
	}
	
	draw_set_halign(fa_left)
	draw_rectangle_color(mouse_x + 30,mouse_y-80,mouse_x + 450,mouse_y + 80,c_white,c_white,c_white,c_white,false)
	draw_text(mouse_x + 50,mouse_y,tip);
	draw_set_halign(fa_center)
}