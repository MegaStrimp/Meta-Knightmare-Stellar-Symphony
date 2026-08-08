///@description MKSS - Enemy - Ghoul Knight - AI - Walk and Attack - Animation End

function scr_MKSS_Enemy_GhoulKnight_AI_WalkAndAttack_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprAttackReady:
		case spriteSet.sprAttack:
		case spriteSet.sprShieldReady:
		case spriteSet.sprGuard:
		image_index = image_number - 1;
		break;
	}
}