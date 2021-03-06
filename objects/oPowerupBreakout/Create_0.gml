/// @desc
image_speed = 0;
drop_speed = irandom_range(5, 7);

//I figure that these can be modified by the chaos setting, making certain 
//posibilities more likely. Also remember that irandom includes 0 in generation
//odds weights
weightArray[POWERUP_TYPES_BREAKOUT.MULTI] = 7;
weightArray[POWERUP_TYPES_BREAKOUT.WIDE] = 3;
weightArray[POWERUP_TYPES_BREAKOUT.NARROW] = 4;
weightArray[POWERUP_TYPES_BREAKOUT.PENETRATE] = 2;

weightTotal = 0;

for(i = 0; i < array_length(weightArray); i++){
	weightTotal += weightArray[i];
}

upgrade_roll = irandom(weightTotal);
upgrade_choice = 0;

var tempTotal = 0;
for(i = 0; i < array_length(weightArray); i++){
	tempTotal += weightArray[i];
	if(upgrade_roll <= tempTotal){
		upgrade_choice = i;
		break;
	}
}
image_index = upgrade_choice;
powerup_type = "breakout";