///@description MKSS - Enemy - Waddle Doo - AI - Walk and Attack - Attack - Step

function scr_MKSS_Enemy_WaddleDoo_AI_WalkAndAttack_Attack_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Waddle Doo - Attack";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Stab Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 60;
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
				
				attackIndex = global.MKSS_AttackIDs[? "WaddleDoo_Attack"];
				
				#region Attack
				//	var projBeam = instance_create_depth(-100,-100,depth,obj_Projectile_Beam);
				//	projBeam.owner = id;
				//	projBeam.abilityType = playerAbilities.beam;
				//	projBeam.dmg = waddleDoo_Beam_Damage;
				//	scr_Attack_SetKnockback(projBeam,waddleDoo_Beam_Strength,waddleDoo_Beam_HitStopAffectSource,waddleDoo_Beam_HitStopAffectPlayer,waddleDoo_Beam_HitStopAffectTarget,waddleDoo_Beam_HitStopLength,waddleDoo_Beam_HitStopShakeStrength);
				//    projBeam.angle = 90 + ((40 - (i * 10)) * -dirX);
				//	projBeam.spd = (1.2 + (i * .2)) * -dirX;
				//	projBeam.orbit = 25 + (i * 15);
				//	projBeam.enemy = true;
				//	projBeam.centerY = -4;
				//	projBeam.hurtsObject = false;
				//	projBeam.hurtsEnemy = false;
				//	projBeam.hurtsPlayer = true;
				//	projBeam.destroyableByWall = false;
				//	projBeam.destroyableByEnemy = false;
				//	projBeam.destroyableByObject = false;
				//	projBeam.hasLimit = false;
				//	projBeam.character = 1;
				//	projBeam.sprite_index = spr_Projectile_Beam_Enemy;
				//	projBeam.pulseTarget = 1;
				//	projBeam.imageIndex = projBeam.image_index;
				//	projBeam.particleTimer = -1;
				//	projBeam.destroyTimer = 60;
				//	projBeam.pulseTimerMax = 2;
				//	projBeam.pulseTimer = projBeam.pulseTimerMax;
				
				for (var i = 0; i < 4; i++)
				{
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
						knockbackAngle = 10;
						knockbackForce = 1;
						sprite_index = spr_MKSS_Enemy_WaddleDoo_Effects_Attack;
						mask_index = spr_MKSS_Attack_WaddleDoo_Stab_Mask;
						dirX = other.dirX;
						image_xscale = other.dirX;
						attackAIEndStep = scr_MKSS_Attack_WaddleDoo_Stab_EndStep;
					}
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