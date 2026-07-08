///@description MKSS - Enemy - Nimbia - AI - Normal - Summon Kracklets - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_SummonKracklets_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Summon Kracklets";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Prepare Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Summon Kracklets Start
		sprite_index = spriteSet.sprLightningStrikePrepare1;
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
			#region Cloud Create
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				var _angle = 135;
				repeat(3)
				{
					if (krackletAmount < krackletLimit)
					{
						with (instance_create_depth(x,y,depth + 1,obj_MKSS_Attack))
						{
							owner = other;
							isEnemy = true;
							dmg = -1;
							sprite_index = spr_MKSS_Attack_Nimbia_Kracklet;
							mask_index = spr_16x16Mask_MiddleOrigin;
							scr_MKSS_Attack_Nimbia_Kracklet_Setup();
							spd = 4;
							angle = _angle;
							movementDmgCooldown = movementDmgCooldownMax;
						}
					}
					_angle -= 45;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 1:
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