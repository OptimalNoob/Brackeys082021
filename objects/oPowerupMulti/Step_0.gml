/// @description Insert description here
// You can write your code in this editor
y += 8;

if(y > room_height + sprite_height){
	instance_destroy();	
}

if(place_meeting(x, y, oPlayer)){
	triggerMultiBall(4, 10);
	instance_destroy();
}