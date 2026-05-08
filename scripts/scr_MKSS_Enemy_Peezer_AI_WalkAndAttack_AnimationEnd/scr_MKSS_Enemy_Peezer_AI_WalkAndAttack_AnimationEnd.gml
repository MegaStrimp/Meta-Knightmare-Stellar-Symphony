///@description MKSS - Enemy - Peezer - AI - Walk and Attack - Animation End

function scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprAttackStart:
		image_index = image_number - 1;
		break;
	}
}