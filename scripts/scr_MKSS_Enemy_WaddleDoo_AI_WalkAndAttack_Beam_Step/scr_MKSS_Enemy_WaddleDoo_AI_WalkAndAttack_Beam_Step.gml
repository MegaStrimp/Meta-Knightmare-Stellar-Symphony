///@description MKSS - Enemy - Waddle Doo - AI - Walk and Attack - Beam - Step

function scr_MKSS_Enemy_WaddleDoo_AI_WalkAndAttack_Beam_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Waddle Doo - Beam";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Ready Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Beam Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Attack End Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 10;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprAttackReady;
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
			#region Ready
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprAttackReady;
				image_index = 0;
				
				dirX = scr_MKSS_Enemy_DirTarget();
				
				attackState++;
			}
			break;
			#endregion
			
			#region Beam
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprAttack;
				image_index = 0;
				
				attackIndex = global.MKSS_AttackIDs[? "waddleDoo_Beam"];
				
				#region Attack
				for (var i = 0; i < 4; i++)
				{
					with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = true;
						dmg = MKSS_Base_EnemyMediumDamage;
						isMelee = true;
						freezeFrameForce = 1;
						knockbackAngle = 10;
						knockbackForce = 1;
						sprite_index = spr_MKSS_Attack_WaddleDoo_Attack;
						mask_index = spr_16x16Mask_MiddleOrigin;
						dirX = other.dirX;
						image_xscale = other.dirX;
						angle = 90 + ((40 - (i * 10)) * -dirX);
						spd = (2.5 + (i * .5)) * -dirX;
						orbit = 5 + (i * 12);
						beamIndex = i;
						pulseActive = false;
						pulseTimerMax = 2;
						pulseTimer = pulseTimerMax;
						attackAIStep = scr_MKSS_Attack_WaddleDoo_Beam_Step;
						attackAIEndStep = scr_MKSS_Attack_WaddleDoo_Beam_EndStep;
					}
				}
				#endregion
				
				attackState++;
			}
			break;
			#endregion
			
			#region Attack End
			case 2:
			if (attackStateTimer[attackState] == -1)
			{
				attackIndex = -1;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Revert
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
				
				dirX = scr_MKSS_Enemy_DirTarget();
			}
			break;
			#endregion
		}
		#endregion
		
		#region Revert If Hurt
		if (hasKnockback)
		{
			scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			
			attackIndex = -1;
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