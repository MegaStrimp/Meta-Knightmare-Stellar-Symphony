///@description MKSS - Enemy - Starless Marx - AI - Normal - Spawn Minimarx - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_SpawnMinimarx_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Starless Marx - Spawn Minimarx";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Start Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Minimarx Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 160;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Spawn Minimarx Variables
		minimarxCount = 3;
		
		wingOutTimerMax = 8;
		wingOutTimer = -1;
		#endregion
		
		#region Spawn Minimarx Start
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decel * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		vsp = scr_Entity_Friction(vsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Start
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				wingOutTimer = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Minimarx
			case 1:
			if (wingOutTimer != -1)
			{
				wingOutTimer = max(wingOutTimer - speedMultFinal,0);
				if (wingOutTimer == 0)
				{
					shakeX = 5;
					shakeY = 2;
					
					sprite_index = spriteSet.sprCharge;
					image_index = 0;
							
					wingOutTimer = -1;
				}
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				wingOutTimer = wingOutTimerMax;
				
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				minimarxCount--;
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if (minimarxCount <= 0) attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 2:
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}