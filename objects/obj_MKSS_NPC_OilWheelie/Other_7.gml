///@description Animation End

switch (sprite_index)
{
	case spr_MKSS_NPC_OilWheelie_DrinkStart:
	sprite_index = spr_MKSS_NPC_OilWheelie_Drink;
	image_index = 0;
	
	spriteTimer = floor(spriteTimerMax / 2);
	break;
	
	case spr_MKSS_NPC_OilWheelie_DrinkEnd:
	sprite_index = spr_MKSS_NPC_OilWheelie_Idle;
	image_index = 0;
	
	spriteTimer = spriteTimerMax;
	break;
}