/// @desc
if(!PermaDeathMode){
	if(keyboard_check_pressed(ord("Y"))){
		var _dir = instance_create_layer(0, 0, "Controllers", Director);
		PreviousRoom = room;
		if(!PermaDeathMode) PlayerLives = 3;
		PlayerScore = 0;
		PlayerLives = 3;
		room_goto(ContinueGameRoom);
	}
}

if(keyboard_check_pressed(ord("N"))){
	if(PermaDeathMode){
		PlayerStages[| STAGE.PONG] = false;
		PlayerStages[| STAGE.BREAKOUT] = false;
		PlayerStages[| STAGE.INVADERS] = false;		
		ContinueGameRoom = -1;
	}
	if(!PermaDeathMode) PlayerLives = 3;
	room_goto(rmTitle);
}