///@description MKSS - Enemy - Gigant Edge - AI - Normal - Animation End

function scr_MKSS_Enemy_GigantEdge_AI_Normal_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprSwordSwingPrepare:
		case spriteSet.sprSwordSwing:
		case spriteSet.sprSwordDash:
		case spriteSet.sprSwordSlam:
		image_index = image_number - 1;
		break;
	}
}