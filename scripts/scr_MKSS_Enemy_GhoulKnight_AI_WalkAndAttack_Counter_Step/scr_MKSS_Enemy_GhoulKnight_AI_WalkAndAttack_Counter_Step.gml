///@description MKSS - Enemy - Ghoul Knight - AI - Walk and Attack - Counter - Step

function scr_MKSS_Enemy_GhoulKnight_AI_WalkAndAttack_Counter_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Ghoul Knight - Counter";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		dirX = scr_MKSS_Enemy_DirTarget();
		canBeHurt = false;
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Stab Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 30;
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
			#region Stab
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprAttack;
				image_index = 0;
				
				attackIndex = global.MKSS_AttackIDs[? "ghoulKnight_Counter"];
				
				#region Attack
				with (instance_create_depth(x,y,depth,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = MKSS_Base_EnemyMediumDamage;
					followOwner = true;
					followOwnerImageIndex = true;
					pauseAfterAnimation = true;
					isMelee = true;
					freezeFrameForce = 1;
					knockbackAngle = 90 - other.dirX;
					knockbackForce = 2;
					sprite_index = spr_MKSS_Enemy_GhoulKnight_Effects_Attack;
					mask_index = spr_MKSS_Attack_GhoulKnight_Stab_Mask;
					dirX = other.dirX;
					image_xscale = other.dirX;
					attackAIEndStep = scr_MKSS_Attack_GhoulKnight_Counter_EndStep;
				}
				#endregion
				
				attackState++;
			}
			break;
			#endregion
			
			#region Revert
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
				
				dirX = scr_MKSS_Enemy_DirTarget();
				
				canBeHurt = true;
				
				attackIndex = -1;
			}
			break;
			#endregion
		}
		#endregion
		
		#region Flash Timer
		if (flashTimer == -1) flashTimer = flashTimerTarget;
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
		
		#region Animation
		if (attackState == 0)
		{
			shakeX = 1;
		}
		#endregion
	}
}