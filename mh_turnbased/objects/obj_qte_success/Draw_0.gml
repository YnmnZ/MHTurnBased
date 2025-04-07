draw_self();
if(obj_manager.sp_sheathe){
	draw_text(x,y+50,"Iai Slash: [Space]");
}else{
	draw_text(x,y+50,"Forsight Slash (Upwards): [W/Up]");
	draw_text(x,y+100,"Forsight Slash (Downwards): [S/Down]");
}