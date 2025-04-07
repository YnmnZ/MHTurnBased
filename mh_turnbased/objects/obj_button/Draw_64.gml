if(instance_place(x,y,obj_cursor)){
	var tip = ""
	switch(display_text){
		case "Attack":
			tip = "AP: 1\n\nDeal 3 damage.\nGain 1 Spirit Point."
			break;
		
		case "Fade Slash":
			tip = "AP: 1\n\nDeal 2 damage.\nMove up or down by 1 unit.\nGain 1 Spirit Point."
			break;
	
		case "Spirit Blade":
			tip = "AP: 1\nSpirit Point: 1\n\nDeal 3 damage.\nIf last skill is also Spirit Blade, damage+1. (maximum +2).\nUse 3 times continuously to gain 1 Spirit Level."
			break;
	
		case "Sp Sheath":
			tip = "AP: 1\n\nReplace your Reaction with Iai Slash.\nEnd your tuen immediately.\nGain 1 Spirit Level if Reaction is successful."
			break;
			
		case "Soaring Kick":
			tip = "AP: 2\nSpirit Level: 1\nCooldown: 1\n\nDeal 10 damage, ignoring Flying.\nMove to the right.\nFor every Spirit Level, deal extra damage."
			break;
		
		case "Serene Pose":
			tip = "AP: 1\nCooldown: 2\n\nYour Reaction this turn is guarenteed to be successful."
			break;
		
		case "Harvest Moon":
			tip = "AP: 1\nCooldown: 3\n\nThe node and all adjacent nodes become buffed.\nOn buffed nodes, your Reaction deal 3 more damage.\nLeaving buffed nodes remove the buff.\nBuffed nodes last for 3 turns."
			break;
		
		case "Move":
			tip = "AP: 1\n\nMove by 1 unit if unsheathed.\nMove by 2 units if sheathed."
			break;
		
		case "Switch":
			tip = "AP: 1\n\nSwitch your sheath state."
			break;
			
		case "Potion":
			tip = "AP: 1\n\nHeal 5 hitpoints."
			break;
		
		case "Antidote":
			tip = "AP: 1\n\nRemove Poison."
			break;
		
		case "Trap":
			tip = "AP: 1\n\nPlace 1 trap on any adjacent node.\nThe trap lasts for 2 turns.\nIf trap is hit by an enemy skill, gain 3 Action Points."
			break;
		
		case "Flash":
			tip = "AP: 1\n\nIf the monster is flying, end flying and gain 3 Action Points."
			break;
	}
	
	if(tip != ""){
		draw_set_halign(fa_left)
		draw_rectangle_color(mouse_x + 30,mouse_y-170,mouse_x + 750,mouse_y + 70,c_white,c_white,c_white,c_white,false)
		draw_text(mouse_x + 50,mouse_y-50,tip);
		draw_set_halign(fa_center)
	}
}