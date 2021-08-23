/// @desc

switch playerStage {
	case pStage.pong: // Pong
		if(pointTo == 1){
			playerScore++;
			if(playerScore < 7) oBallPong.reset_paddles();
			pointTo = 0;
		} else if (pointTo == -1) {
			enemyScore++;
			oBallPong.reset_paddles();
			pointTo = 0;
		}
	
		if (playerScore >= 7) {
			playerStage = pStage.breakout;
			playerX = oPlayer.x;
			playerY = oPlayer.y;
			room_goto(rmBreakout);
			playerScore = 100;
		}
		break;
	case pStage.breakout: // Breakout
		
		break;
	default: break;
}

if(keyboard_check_pressed(ord("O"))) playerScore++;

if(playerStage != pStage.pong){
	if(playerScore < 1000) leadingZeros = 4;
	else if(playerScore < 10000 && playerScore >= 1000) leadingZeros = 3;
	else if(playerScore < 100000 && playerScore >= 10000) leadingZeros = 2;
	else if(playerScore < 1000000 && playerScore >= 100000) leadingZeros = 1;
}

// Debug Controls
if(keyboard_check_pressed(ord("R"))) game_restart();