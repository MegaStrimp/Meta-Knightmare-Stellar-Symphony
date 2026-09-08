///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Star Slash - Step

function scr_MKSS_Enemy_Andromeda1_AI_Normal_StarSlash_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Andromeda - Star Slash";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Indicator Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slash Start Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slash Timer
		attackStateTimerMax[i] = 10;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Star Slash Variables
		slashCountMax = 2;
		slashCount = slashCountMax;
		#endregion
		
		#region Star Slash Start
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		
		slashList = ds_list_create();
		
		arm[0] = true;
		arm[1] = true;
		
		armRBOffsetX = 22;
		armRBOffsetY = -14;
		armRBAngle = 180;
		armRBDir[0] = -1;
		
		armLBOffsetX = -26;
		armLBOffsetY = -14;
		armLBAngle = -130;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decelSlash * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Indicator
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				slashCount--;
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if (slashCount <= 0) attackState++;
			}
			break;
			#endregion
			
			#region Slash Start
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Slash
			case 2:
			if (attackStateTimer[attackState] == -1)
			{
				armRBOffsetX = 22;
				armRBOffsetY = 9;
				armRBAngle = 15;
		
				armLBOffsetX = -23;
				armLBOffsetY = 15;
				armLBAngle = 50;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 3:
			if (hsp != 0) 
			{
				var decelFinal = decelThrust * speedMultFinal;
		
				hsp = scr_Entity_Friction(hsp,decelFinal);
				
				repeat(4) 
				{
					scr_MKSS_ParticleSet_LightningBall(x-(irandom_range(-3,6)*dirX),y-12+lightningOffset);
					lightningOffset += lightningOffsetDir;
					if (lightningOffset <= -lightningOffsetLimit) lightningOffsetDir = 1;
					if (lightningOffset >= lightningOffsetLimit) lightningOffsetDir = -1;
				}
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Collision
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}