///@description MKSS - Enemy - Gigant Edge - AI - Normal - Animation End

function scr_MKSS_Enemy_GigantEdge_AI_Normal_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprSwordSwingPrepare:
		case spriteSet.sprSwordSwing:
		case spriteSet.sprSwordDashPrepare:
		case spriteSet.sprSwordSlamDuck:
		case spriteSet.sprSwordSlamJump:
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprSwordGrab:
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		break;
		
		case spriteSet.sprSwordSlamPrepare:
		sprite_index = spriteSet.sprSwordSlamDuck;
		image_index = 0;
		break;
		
		case spriteSet.sprSwordThrow:
		sprite_index = spriteSet.sprSwordThrowWait;
		image_index = 0;
		break;
	}
}