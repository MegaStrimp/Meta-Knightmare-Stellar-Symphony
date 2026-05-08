///@description MKSS - Enemy - Starless Marx - AI - Normal - Shooter Cutter - Animation End

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_ShooterCutter_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprBallIn:
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprBallOut:
		imageSpeed = 1;
		
		for (var i = 0; i < 4; i++)
		{
			attackIndex = global.MKSS_AttackIDs[? "starlessMarx_ShooterCutter"];
			script_execute_ext(global.MKSS_AttackList[attackIndex].executeAttackScript,[(45 + shooterCutter_CurrentCutterIndex * 90) % 360,(shooterCutter_CurrentCutterIndex == shooterCutter_ParriableCutterIndex)]);
			
			shooterCutter_CurrentCutterIndex += 1;
		}

		sprite_index = spriteSet.sprIdle;
		image_index = image_number - 1;
		break;
	}
}