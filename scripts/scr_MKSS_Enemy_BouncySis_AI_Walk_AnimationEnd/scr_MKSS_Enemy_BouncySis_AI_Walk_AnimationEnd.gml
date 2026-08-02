///@description MKSS - Enemy - Bouncy Sis - AI - Walk - Animation End

function scr_MKSS_Enemy_BouncySis_AI_Walk_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprBounceReady:
		case spriteSet.sprBounce:
		image_index = image_number - 1;
		break;
	}
}