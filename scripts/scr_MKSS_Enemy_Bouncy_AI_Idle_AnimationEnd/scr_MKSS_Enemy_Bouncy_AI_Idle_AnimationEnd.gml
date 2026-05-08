///@description MKSS - Enemy - Bouncy - AI - Idle - Animation End

function scr_MKSS_Enemy_Bouncy_AI_Idle_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprBounceReady:
		case spriteSet.sprBounce:
		image_index = image_number - 1;
		break;
	}
}