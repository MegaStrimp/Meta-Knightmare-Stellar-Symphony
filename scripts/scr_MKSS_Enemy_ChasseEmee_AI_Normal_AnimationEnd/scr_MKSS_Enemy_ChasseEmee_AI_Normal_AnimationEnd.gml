///@description MKSS - Enemy - Chasse Emee - AI - Normal - Animation End

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprSlashPrepare1:
		case spriteSet.sprSlash1:
		image_index = image_number - 1;
		break;
	}
}