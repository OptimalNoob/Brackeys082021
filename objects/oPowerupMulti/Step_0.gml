/// @desc
y += 8;

if(y > room_height + sprite_height){
	instance_destroy();	
}

if(place_meeting(x, y, oPlayer)){
	triggerMultiBall(5, 1);
	instance_destroy();
}