body_part_array = [];
body_part = [["Head",30],["Wings",55],["Legs",55],["Tail",40]];
skill_array = [["Fireball","random",2,2,3,"Burn",1,-1,0],["Charged Fireball","player",3,3,2,"Burn",2,-1,0],["Bite","random",1,1,3,"",0,0,0],["Land","none",0,1,4,"",0,1,1],["Take Off","none",0,1,2,"",0,0,1],["Dash","row",3,2,3,"",0,0,2],["Dive","player",4,2,3,"",0,1,2],["Sweep","col",3,2,3,"Poison",2,0,3],["Sweep Take Off","player",3,2,3,"Poison",2,-1,3]]

for(var i = 0; i < array_length(body_part);i++){
	var part = instance_create_depth(x+350,120*(i+1),0,obj_bodypart);
	part.part_name = body_part[i][0];
	part.part_max_hitpoint = body_part[i][1];
	part.part_hitpoint = part.part_max_hitpoint;
	array_push(body_part_array,part)
}

flying= false;
hitpoint = 180;

selected_skill = "error"