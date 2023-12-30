instance_deactivate_all(true);

units = [];

// Make enemies
for (var _i = 0; _i < array_length(enemies); _i++) {
	
	enemy_units[_i] = instance_create_depth(x+200+(_i*20),y+120+(_i*20),depth-10,obj_battle_unit_enemy, enemies[_i]);
	array_push(units, enemy_units[_i]);
}

// Make party
for (var _i = 0; _i < array_length(global.party); _i++) {
	
	party_units[_i] = instance_create_depth(x+40+(_i*20),y+120+(_i*20),depth-10,obj_battle_unit_pc, global.party[_i]);
	array_push(units, party_units[_i]);
}








