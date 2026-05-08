///@description MKSS - Enemy - Starless Marx - AI - Normal - Shooter Cutter - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_ShooterCutter_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		enemyAnimationEnd = scr_MKSS_Enemy_StarlessMarx_AI_Normal_ShooterCutter_AnimationEnd;
		
		sprite_index = spriteSet.sprBallIn;
		image_index = 0;
		
		shooterCutter_Count += 1;
		shooterCutter_AttackTimer = shooterCutter_AttackTimerMax;
		
		shooterCutter_CurrentCutterIndex = 0;
		
		with (obj_Player)
		{
			if (y < other.y)
			{
				if (x < other.x)
				{
					other.shooterCutter_ParriableCutterIndex = 0;
				}
				else
				{
					other.shooterCutter_ParriableCutterIndex = 1;
				}
			}
			else
			{
				if (x < other.x)
				{
					other.shooterCutter_ParriableCutterIndex = 3;
				}
				else
				{
					other.shooterCutter_ParriableCutterIndex = 2;
				}
			}
		}
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Shooter Cutter - Attack Timer
		if (shooterCutter_AttackTimer != -1)
		{
			shooterCutter_AttackTimer = max(shooterCutter_AttackTimer - speedMultFinal,0);
			if (shooterCutter_AttackTimer == 0)
			{
				sprite_index = spriteSet.sprBallOut;
				image_index = 0;
				imageSpeed = 3;
				
				shooterCutter_AttackTimer = -1;
			}
		}
		#endregion
		
		#region Shooter Cutter - Cancel Timer
		if (shooterCutter_CancelTimer != -1)
		{
			shooterCutter_CancelTimer = max(shooterCutter_CancelTimer - speedMultFinal,0);
			if (shooterCutter_CancelTimer == 0)
			{
				if (shooterCutter_Count == 1)
				{
					scr_MKSS_Enemy_StarlessMarx_Teleport(192,96,scr_MKSS_Enemy_StarlessMarx_AI_Normal_ShooterCutter_Step);
				}
				else
				{
					scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_StarlessMarx_AI_Normal_Idle_Step);
					
					shooterCutter_Count = 0;
				}
				
				shooterCutter_CancelTimer = -1;
			}
		}
		#endregion
	}
}