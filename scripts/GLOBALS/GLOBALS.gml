#macro MARGINS 32
#macro PSPAWNX 208
#macro PSPAWNY 656
#macro PLAYAREA_WIDTH 360
#macro PLAYAREA_HEIGHT 640

/// @function build_globals
/// @desc initiate global variables
function build_globals(){
	/// ---------- SYSTEM ---------- ///
	
	globalvar PAUSED; PAUSED = false;
	globalvar PlayerStages;	PlayerStages = ds_list_create();
	ds_list_add(PlayerStages, false, false, false, false);
	globalvar ChaosFactor; ChaosFactor = 1;
	globalvar DirectorInit; DirectorInit = false;
	globalvar PreviousRoom; PreviousRoom = rmTitle;
	globalvar DebugMode; DebugMode = false;
	globalvar PermaDeathMode; PermaDeathMode = false;
	globalvar ContinueGameRoom; ContinueGameRoom = -1;
	globalvar PenetratingBalls; PenetratingBalls = false;
	globalvar SoundEnabled; SoundEnabled = true;
	
	/// ---------- PLAYER ---------- ///
		
	globalvar PlayerScore; PlayerScore = 0;
	globalvar PlayerHighScore; PlayerHighScore = 0;
	globalvar CurrentPlayer; CurrentPlayer = oPlayer;
	globalvar PlayerX;	PlayerX = (MARGINS + 400) / 2;
	globalvar PlayerY;	PlayerY = 640;
	globalvar PlayerType; PlayerType = PTYPE.PADDLE;
	globalvar PlayerLives; PlayerLives = 0;
	
	/// ---------- ENEMIES ---------- ///
	
	globalvar EnemyPaddleX; EnemyPaddleX = 224;
	globalvar EnemyPaddleY; EnemyPaddleY = 64;
	globalvar paddleTarget; paddleTarget = oBall;
	globalvar EnemyPaddleSpeed;	EnemyPaddleSpeed = 3;
	
}
