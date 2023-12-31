/// @description Draw overlays

//draw background art
draw_sprite(spr_battle_background,0,x,y);

//draw units in depth order
var _unit_with_current_turn = unit_turn_order[turn].id;
for (var _i = 0; _i < array_length(unit_render_order); _i++) {
	with (unit_render_order[_i]) {
		draw_self();
	}
}

// draw ui boxes
draw_sprite_stretched(spr_box, 0, x+64, y+192,192, 64);
draw_sprite_stretched(spr_box, 0, x, y+192,64, 64);

// Positions/magic numbers
#macro COLUMN_ENEMY 5
#macro COLUMN_NAME 70
#macro COLUMN_HP 140
#macro COLUMN_MP 200

//Draw headings
draw_set_font(fnt_amiri_quran);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_gray);
draw_text(x+COLUMN_ENEMY, y+(room_height*0.75), "ENEMY");
draw_text(x+COLUMN_NAME, y+(room_height*0.75), "NAME");
draw_text(x+COLUMN_HP, y+(room_height*0.75), "HP");
draw_text(x+COLUMN_MP, y+(room_height*0.75), "MP");

// set draw properties
draw_set_font(fnt_amiri_quran);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

// draw enemy names
var _draw_limit = 4; // limit the number of rows for enemies
var _drawn = 0;

for (var _i = 0; (_i < array_length(enemy_units)) && (_drawn < _draw_limit); _i++) {
	var _char = enemy_units[_i];
	
	//enemy is alive
	if (_char.hp > 0) {
		_drawn++;
		draw_set_color(c_white);
		if (_char.id == _unit_with_current_turn) {
			draw_set_color(c_yellow);
		}
		draw_text(x+COLUMN_ENEMY, y+((room_height*0.82)+(_i*20)), _char.name);
	}
	
	//enemy is dead
	if (_char.hp <= 0) {
		_drawn++;
		draw_set_color(c_red);
		draw_text(x+COLUMN_ENEMY, y+((room_height*0.82)+(_i*20)), _char.name);
	}
	
	// set color back to white to avoid bugs
	draw_set_color(c_white);
}


// Draw party info
for (var _i = 0; _i < array_length(party_units); _i++) {
	
	//draw name
	draw_set_color(c_white);
	var _char = party_units[_i];
	if (_char.id == _unit_with_current_turn) draw_set_color(c_yellow);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_NAME, y+((room_height*0.82)+(_i*20)), _char.name);
	
	//draw hp
	if(_char.hp < (_char.hp * 0.5)) draw_set_color(c_orange);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_HP, y+((room_height*0.82)+(_i*20)), string(_char.hp) + "/" + string(_char.hp_max));
	
	//draw mp
	if(_char.mp < (_char.mp * 0.5)) draw_set_color(c_orange);
	if (_char.mp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_MP, y+((room_height*0.82)+(_i*20)), string(_char.mp) + "/" + string(_char.mp_max));
	
	// set color back to white to avoid bugs
	draw_set_color(c_white);
	
}
