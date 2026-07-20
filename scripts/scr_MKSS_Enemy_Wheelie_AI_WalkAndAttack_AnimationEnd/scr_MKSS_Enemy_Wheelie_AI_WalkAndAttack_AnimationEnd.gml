///@description MKSS - Enemy - Wheelie - AI - Walk and Attack - Animation End

function scr_MKSS_Enemy_Wheelie_AI_WalkAndAttack_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprTurn:
		isTurning = false;
		
		sprite_index = spriteSet.sprTurn;
		image_index = 0;
		break;
	}
}