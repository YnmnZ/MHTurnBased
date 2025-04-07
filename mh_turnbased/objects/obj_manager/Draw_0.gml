switch(state){
	case "initial":
		
		
		break;
	
	case "player choose state":
		
		draw_set_font(fnt_text_large);
		draw_set_color(c_white);
		draw_text(room_width/2,room_height/2 + 100,"Choose your stance to start this turn")
		draw_set_font(fnt_text);
		
		break;
}

draw_set_color(c_white);
draw_set_halign(fa_left)
draw_text(100,room_height / 2 + 50,"ACTION "+string(action_point));
draw_text(100,room_height / 2 + 80,"HP "+string(player_hp) + "/" + string(player_max_hp));
draw_text(300,room_height / 2 + 50,"SPIRIT POINT "+string(spirit_point) + "/" + string(spirit_point_max));
var state_text = ""
for(var i = 0; i<array_length(player_state);i++){
	var state_name = player_state[i][0];
	var state_level = player_state[i][1];
	if(state_level>0){
		state_text += state_name + "(" + string(state_level) + ") ";
	}
}
draw_text(300,room_height / 2 + 80,"STATE: " + state_text);
draw_set_halign(fa_center)