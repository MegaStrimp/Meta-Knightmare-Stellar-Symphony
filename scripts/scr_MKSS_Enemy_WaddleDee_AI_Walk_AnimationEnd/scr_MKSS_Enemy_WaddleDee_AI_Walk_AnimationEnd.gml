///@description MKSS - Enemy - Waddle Dee - AI - Walk - Animation End

function scr_MKSS_Enemy_WaddleDee_AI_Walk_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprAttackReady:
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprAttack:
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprAttackEnd:
		image_index = image_number - 1;
		break;
	}
}