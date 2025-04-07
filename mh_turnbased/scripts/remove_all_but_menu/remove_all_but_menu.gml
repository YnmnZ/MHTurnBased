// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function remove_all_but_menu(remove_level = 1){
	with(obj_button){
		if(level > remove_level){
			instance_destroy();
		}
	}

}