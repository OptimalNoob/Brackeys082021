/// @desc

if(PlayerStages[| STAGE.PONG]) player_control_movement();
if(PlayerStages[| STAGE.INVADERS]) player_control_shooting();

if(x > MARGINS + PLAYAREA_WIDTH - (sprite_width / 2)) x = MARGINS + PLAYAREA_WIDTH - (sprite_width / 2);
if(x < MARGINS + (sprite_width / 2)) x = MARGINS + (sprite_width / 2);

if(!animating){
	if(currentPowerups[| POWERUP.WIDE]){
		sprite_index = playerSpriteLib[# 2, PlayerType];
		mask_index = sPlayerPaddle_wide;
	}
	
	if(currentPowerups[| POWERUP.NARROW]){
		sprite_index = playerSpriteLib[# 1, PlayerType];
		mask_index = sPlayerPaddle_narrow
	}
}

if(currentPowerups[| POWERUP.SPREAD]){
	// Spread Shot Logic (should probably go in player_control_shooting() )	
}

if(currentPowerups[| POWERUP.SHIELD]){
	// Player Shield Logic	
}

var powerup_col = instance_place(x, y, Parent_Powerups);
if(powerup_col != noone){
	audio_play_sound(sndPowerup01, 1, false);
	switch(powerup_col.powerup_type){
		case "breakout":
			switch(powerup_col.upgrade_choice){
				case 0:
					var _count = math_map_int(ChaosFactor, 1, 10, 3, 10);
					var _spread = math_map_int(ChaosFactor, 1, 10, 2, 6);
					powerup_trigger_multiball(_count, _spread);
					break;
				case 1:
					var _dur = math_map_int(ChaosFactor, 1, 10, (30 * 60), (5 * 60));
					powerup_trigger_wide(_dur);
					break;
				case 2:
					var _dur = math_map_int(ChaosFactor, 1, 10, (5 * 60), (30 * 60));
					powerup_trigger_narrow(_dur);
					break;
				case 3:
					var _dur = math_map_int(ChaosFactor, 1, 10, (10 * 60), (1 * 60));
					powerup_trigger_penetration(5 * 60)
					break;
			}
		break;
		case "invaders":
			switch(powerup_col.upgrade_choice){
				case 0:
					var _life = math_map_int(ChaosFactor, 1, 10, 20, 3);
					powerup_trigger_shield(_life);
					break;
				case 1:
					var _dur = math_map_int(ChaosFactor, 1, 10, (30 * 60), (10 * 60));
					powerup_trigger_spread(_dur);
					break;
				case 2:
					var _dur = math_map_int(ChaosFactor, 1, 10, (30 * 60), (5 * 60));
					powerup_trigger_swift(_dur)
					break;
			}
		break;
		default: break;
	}
	instance_destroy(powerup_col);
}

if(player_health <= 0){
	if(!PermaDeathMode){
		if(PlayerLives <= 0){
			game_over();
		}
		PlayerLives--;
		player_health = ceil(5 * health_factor);
	} else {
		game_over();
	}
}

if(DebugMode){
	if(keyboard_check_pressed(vk_control)){
		instance_create_depth(x, y - 128, -20, oPowerupBreakout);	
	}
}





