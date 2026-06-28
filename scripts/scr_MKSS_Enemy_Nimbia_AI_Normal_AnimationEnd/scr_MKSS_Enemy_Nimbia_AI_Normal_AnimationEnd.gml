///@description MKSS - Enemy - Nimbia - AI - Normal - Animation End

function scr_MKSS_Enemy_Nimbia_AI_Normal_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprSlashPrepare1:
		case spriteSet.sprSlashPrepare2:
		case spriteSet.sprSlashPrepare3:
		case spriteSet.sprSlash1:
		case spriteSet.sprSlash2:
		case spriteSet.sprSlash3:
		case spriteSet.sprSlash4:
		case spriteSet.sprThrustPrepare1:
		case spriteSet.sprThrust1:
		case spriteSet.sprDownThrust1:
		case spriteSet.sprLightningStrikePrepare1:
		case spriteSet.sprLightningStrike1:
		image_index = image_number - 1;
		break;
	}
}