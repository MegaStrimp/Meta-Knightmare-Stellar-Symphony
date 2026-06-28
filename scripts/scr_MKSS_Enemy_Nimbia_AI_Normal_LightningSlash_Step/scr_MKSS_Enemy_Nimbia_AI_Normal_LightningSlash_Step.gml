///@description MKSS - Enemy - Nimbia - AI - Normal - Lightning Slash - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_LightningSlash_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Lightning Slash";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Slash Timer
		attackStateTimerMax[i] = 55;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Lightning Timer
		attackStateTimerMax[i] = 8;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Lightning Slash Start
		sprite_index = spriteSet.sprSlashPrepare2;
		image_index = 0;
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
			#region Slash
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprSlash3;
				image_index = 0;
				
				hsp = 5 * dirX;
				
				scr_PlaySfx(snd_MKSS_Throw);
				
				attackState++;
			}
			break;
			#endregion
			
			#region Lightning
			case 1:
			if (hsp == 0) dirX = scr_MKSS_Enemy_DirTarget();
			else attackStateTimer[attackState] = attackStateTimerMax[attackState];
			
			if (attackStateTimer[attackState] == -1)
			{
				with (instance_create_depth(x+(40*dirX),y,depth + 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					knockbackForce = 1;
					hsp = 4*other.dirX;
					vsp = 0;
					dirX = other.dirX;
					image_xscale = dirX * scale;
					sprite_index = spr_MKSS_Attack_Nimbia_LightningGround;
					mask_index = spr_MKSS_Attack_Nimbia_LightningGround;
					attackAIStep = scr_MKSS_Attack_Nimbia_LightningGround_Step;
					destroyOutsideRoom = true;
					destroyAfterCollideWall = true;
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