///@description MKSS - Enemy - Chasse Emee - AI - Normal - Ultra Sword - Step

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_UltraSword_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Chasse-Emee - Ultra Sword";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Prepare Timer
		attackStateTimerMax[i] = 70;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Ultra Sword Timer
		attackStateTimerMax[i] = 8;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 70;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Ultra Sword Variables
		#endregion
		
		#region Ultra Sword Start
		sprite_index = spriteSet.sprUltraSwordPrepare;
		image_index = 0;
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
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprUltraSwordSwing;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Ultra Sword
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				with (instance_create_depth(x + (32 * dirX),y,depth + 2,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_ChasseEmee_UltraSwordProjectile;
					mask_index = spr_MKSS_Attack_ChasseEmee_UltraSwordProjectile;
					dirX = other.dirX;
					image_xscale = dirX;
					hsp = 4 * dirX;
					destroyAfterAnimation = true;
					attackAIStep = scr_MKSS_Attack_ChasseEmee_UltraSwordProjectile_Step;
				}
				
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