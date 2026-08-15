///@description MKSS - Enemy - Waddle Doo - AI - Walk and Attack - Animation End

function scr_MKSS_Enemy_WaddleDoo_AI_WalkAndAttack_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprAttack:
		image_index = image_number - 1;
		break;
	}
}