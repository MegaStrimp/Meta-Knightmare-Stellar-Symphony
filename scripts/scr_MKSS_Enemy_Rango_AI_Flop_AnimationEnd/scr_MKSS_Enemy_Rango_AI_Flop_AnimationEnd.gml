///@description MKSS - Enemy - Rango - AI - Flop - Animation End

function scr_MKSS_Enemy_Rango_AI_Flop_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprFlopJump:
		image_index = image_number - 1;
		break;
	}
}