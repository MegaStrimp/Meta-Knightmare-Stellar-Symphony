///@description MKSS - Enemy - Wheelie - AI - Walk - Animation End

function scr_MKSS_Enemy_Wheelie_AI_Walk_AnimationEnd()
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