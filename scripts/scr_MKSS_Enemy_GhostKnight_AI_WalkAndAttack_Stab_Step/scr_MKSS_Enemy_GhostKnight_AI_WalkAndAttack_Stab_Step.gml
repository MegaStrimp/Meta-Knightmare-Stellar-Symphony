///@description MKSS - Enemy - Ghost Knight - AI - Walk and Attack - Stab - Step

function scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Stab_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Ghost Knight - Stab";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		
		scr_PlaySfx(snd_MKSS_Action1);
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Stab Timer
		attackStateTimerMax[i] = 25;
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
				
				attackIndex = global.MKSS_AttackIDs[? "ghostKnight_Stab"];
				
				scr_PlaySfx(snd_MKSS_GhostKnightStab);
				
				#region Attack
				with (instance_create_depth(x,y,depth,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = MKSS_Base_EnemyBasicDamage;
					followOwner = true;
					followOwnerImageIndex = true;
					pauseAfterAnimation = true;
					isMelee = true;
					freezeFrameForce = 1;
					knockbackAngle = 10;
					knockbackForce = 1;
					sprite_index = spr_MKSS_Enemy_GhostKnight_Effects_Attack;
					mask_index = spr_MKSS_Attack_GhostKnight_Stab_Mask;
					dirX = other.dirX;
					image_xscale = other.dirX;
					attackAIEndStep = scr_MKSS_Attack_GhostKnight_Stab_EndStep;
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
				
				attackIndex = -1;
			}
			break;
			#endregion
		}
		#endregion
		
		#region Revert If Died
		if (hp <= 0)
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