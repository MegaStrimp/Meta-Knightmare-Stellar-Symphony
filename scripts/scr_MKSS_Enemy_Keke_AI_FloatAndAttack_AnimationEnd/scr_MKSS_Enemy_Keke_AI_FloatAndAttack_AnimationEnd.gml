///@description MKSS - Enemy - Keke - AI - Float and Attack - Animation End

function scr_MKSS_Enemy_Keke_AI_FloatAndAttack_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprAttackReady:
		case spriteSet.sprAttackEnd:
		image_index = image_number - 1;
		break;
	}
}