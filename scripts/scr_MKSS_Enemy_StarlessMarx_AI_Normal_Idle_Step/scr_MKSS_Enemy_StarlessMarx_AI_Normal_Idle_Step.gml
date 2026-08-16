///@description MKSS - Enemy - Starless Marx - AI - Normal - Idle - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_Idle_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		if ((isBoss) and (isBossSetup))
		{
			//scr_MKSS_Enemy_Miniboss_Setup();
			scr_MKSS_MarkBoss(id);
			scr_MKSS_Enemy_HealthbarFill_Setup(id);
			
			isBossSetup = false;
		}
		
		attackTimer = attackTimerMax;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Float
		drawYOffset = sine_between((global.currentTimePausable / 10),4,-2,2);
		#endregion
		
		#region Attack Timer
		if (attackTimer != -1)
		{
			attackTimer = max(attackTimer - speedMultFinal,0);
			if (attackTimer == 0)
			{	
				var _attackIndex = ds_list_find_value(attackList,attackListIndex);
				
				attackIndex = _attackIndex;
				attackListIndex = (attackListIndex + 1) % (ds_list_size(attackList));
				
				if (_attackIndex == marx_Attack_ShooterCutter) 
				{
					scr_MKSS_Enemy_StarlessMarx_Teleport(64,84,marx_Attack_ShooterCutter,,3);
				}
				else 
				{
					if (script_exists(attackIndex)) scr_Enemy_ChangeState_Step(id,attackIndex);
				}
				
				attackTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprIdle;
		#endregion
	}
}