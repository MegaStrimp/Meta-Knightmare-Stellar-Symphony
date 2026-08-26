///@description MKSS - Enemy - Grand Wheelie - AI - Normal - Animation End

function scr_MKSS_Enemy_GrandWheelie_AI_Normal_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprTurn:
		isTurning = false;
		
		sprite_index = spriteSet.sprWalk;
		image_index = 0;
		break;
	}
}