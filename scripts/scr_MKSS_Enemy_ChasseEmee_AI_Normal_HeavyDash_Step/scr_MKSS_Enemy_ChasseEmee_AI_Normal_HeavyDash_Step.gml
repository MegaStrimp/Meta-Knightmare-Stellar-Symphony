///@description MKSS - Enemy - Chasse Emee - AI - Normal - Heavy Dash - Step

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_HeavyDash_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Chasse-Emee - Heavy Dash";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Prepare Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Dash Start Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Dash Timer
		attackStateTimerMax[i] = 120;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Heavy Dash Variables
		dashSpeed = 0;
		dashSpeedMax = 8;
		dashSpeedAccel = .2;
		
		hasGravity = false;
		#endregion
		
		#region Heavy Dash Start
		sprite_index = spriteSet.sprDash1;
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
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Prepare
			case 0:
			hsp = -1 * dirX;
			if (attackStateTimer[attackState] == -1)
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Dash Start
			case 1:
			shakeX = 1;
			
			if (attackStateTimer[attackState] == -1)
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Dash
			case 2:
			dashSpeed = min(dashSpeed + (dashSpeedAccel * speedMultFinal),dashSpeedMax);
			hsp = dashSpeed * dirX;
			
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				x = -96;
				if (dirX == 1) x = room_width+96;
				
				dirX = -dirX;
				
				hsp = 5.6 * dirX;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				hsp = 0;
				
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Gravity
		if (hasGravity) vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(hasGravity,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}