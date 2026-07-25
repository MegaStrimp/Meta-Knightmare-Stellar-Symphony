///@description MKSS - Enemy - Chasse Emee - AI - Normal - Claw Launch - Step

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_ClawLaunch_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Chasse-Emee - Claw Launch";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Prepare Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Claw Launch Timer
		attackStateTimerMax[i] = 600;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Claw Launch Variables
		arm = -1;
		#endregion
		
		#region Claw Launch Start
		sprite_index = spriteSet.sprClawLaunch;
		image_index = 0;
		
		with (instance_create_depth(x + (24 * dirX),y - 8,depth + 2,obj_MKSS_Attack))
		{
			owner = other;
			isEnemy = true;
			dmg = 1;
			sprite_index = spr_MKSS_Attack_ChasseEmee_ClawOpen;
			mask_index = spr_MKSS_Attack_ChasseEmee_ClawOpen;
			scr_MKSS_Attack_ChasseEmee_ClawLaunch_Setup();
			other.arm = id;
		}
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decelFast * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Prepare
			case 0:
			with (arm) if (hsp == 0) hsp = -3;
			
			if (attackStateTimer[attackState] == -1)
			{
				with (arm) 
				{
					hsp = 8;
					
					launch = true;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Claw Launch
			case 1:
			if (attackStateTimer[attackState] == -1) or (!instance_exists(arm))
			{
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				attackState++;
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
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}