///@description MKSS - Enemy - Ghost Knight - AI - Walk and Attack - Parry - Step

function scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Parry_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Ghost Knight - Stab";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		dirX = scr_MKSS_Enemy_DirTarget();
		
		canParry = false;
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Parry Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		
		parryIndicator = scr_MKSS_UI_ParryIndicator_Create(x,y,depth - 1,attackStateTimer[i],,id,true);
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprShieldReady;
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
			#region Parry
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				var sfx = scr_PlaySfx(snd_MKSS_ParryExecuteEnemy);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				sprite_index = spriteSet.sprGuard;
				image_index = 0;
				
				attackIndex = global.MKSS_AttackIDs[? "ghostKnight_Parry"];
				
				canBeHurt = false;
				canParry = true;
				
				parryGhostParticle = scr_MKSS_ParticleSet_ParryGhost(x,y,dirX,,,true);
				
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
				
				with (parryIndicator) instance_destroy();
				with (parryGhostParticle[0]) instance_destroy();
				
				canBeHurt = true;
				canParry = false;
				
				attackIndex = -1;
			}
			
			#region Flash Timer
			if (flashTimer == -1) flashTimer = flashTimerTarget;
			#endregion
			break;
			#endregion
		}
		#endregion
		
		#region Parry
		if (canParry)
		{
			with (obj_Attack)
			{
				if ((!isEnemy) and (isMelee) and (distance_to_object(other) <= 8))
				{
					var sfx = scr_PlaySfx(snd_MKSS_ParryEnemy);
					audio_sound_pitch(sfx,random_range(.85,1.15));
					
					scr_Enemy_ChangeState_Step(other,other.ghostKnight_Attack_Counter);
					
					scr_MKSS_ParticleSet_ParryCircle(owner.x,owner.y,true);
					
					scr_SetGlobalFreezeFrame(8);
					
					scr_MKSS_UI_BackgroundOverlay_Create(0);
					
					scr_MKSS_Player_GetStunned(owner);
				}
			}
		}
		#endregion
		
		#region Revert If Died
		if (hp <= 0)
		{
			scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
				
			with (parryIndicator) instance_destroy();
			if (attackState > 0) with (parryGhostParticle[0]) instance_destroy();
			
			canBeHurt = true;
			canParry = false;
			flashTimer = false;
			
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
		
		#region Animation
		if (attackState == 0)
		{
			shakeX = 1;
		}
		#endregion
	}
}