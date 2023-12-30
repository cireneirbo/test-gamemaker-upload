// Script assets have changed for v2.3.0 see
// party data
function scr_game_data(){

	global.party = [
		/*{
			name: "Lister",
			hp: 89,
			hp_max: 89,
			mp: 10,
			mp_max: 15,
			strength: 6,
			sprites: {},
			actions: []
		},*/
		{
			name: "Rimmer",
			hp: 18,
			hp_max: 44,
			mp: 20,
			mp_max: 30,
			strength: 4,
			sprites: { idle: spr_rimmer_idle, attack: spr_rimmer_attack, cast: spr_rimmer_cast, down: spr_rimmer_down },
			actions: []
	
		}


	];


	global.enemies = {
		slime: {
			name: "Slime",
			hp: 30,
			hp_max: 30,
			mp: 0,
			mp_max: 0,
			strength: 5,
			sprites: {idle: spr_slime_idle, attack: spr_slime_attack},
			actions: [],
			xp_value: 15,
			ai_script: function() {
				// enemy turn ai goes here
			}
		},
		/*bat: {
			name: "Bat",
			hp: 15,
			hp_max: 15,
			mp: 0,
			mp_max: 0,
			strength: 4,
			sprites: {},
			actions: [],
			xp_value: 18,
			ai_script: function() {
				// enemy turn ai goes here
			}
		},*/
	};

}