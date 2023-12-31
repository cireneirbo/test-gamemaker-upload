instance_deactivate_all(true);

units = [];
turn = 0;
unit_turn_order = [];
unit_render_order = [];
enemy_units = [];
party_units = [];



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


// Shuffle turn order
unit_turn_order = array_shuffle(units);

// Get render order
refresh_render_order = function() {
	unit_render_order = [];
	array_copy(unit_render_order, 0, units, 0, array_length(units));
	array_sort(unit_render_order, function(_1, _2) {
		return _1.y - _2.y;
	});
}

show_debug_message(enemy_units);

refresh_render_order();

