///@description MKSS - Enemy - Chunky Dee - AI - Normal - Animation End

function scr_MKSS_Enemy_ChunkyDee_AI_Normal_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprHold:
		case spriteSet.sprThrow:
		case spriteSet.sprJump:
		case spriteSet.sprSlam:
		image_index = image_number - 1;
		break;
	}
}