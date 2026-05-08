///@description Player - Meta Knight - State - Parry - Step

function scr_MKSS_Player_MetaKnight_State_Parry_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		scr_PlaySfx(snd_MKSS_ParryExecute);
		
		parryGhostParticle = scr_MKSS_ParticleSet_ParryGhost(x,y,dirX,spr_MKSS_Player_MetaKnight_Normal_Base_Parry,spr_MKSS_SprayPaint_Misc_ParryCooldown);
		
		vsp = 0;
		parryEndTimer = 30;
		attackMakeFlash = true;
		flashTimer = flashTimerTarget;
		
		attackMakeHeavyInvincible = true;
		parryHeavyInvinTimer = 1;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		#region Decelerate
		var decelFinal = decel * 2 * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Speed Limit
		var hasSpeedLimit = true;
		if (hurtState == hurtStates.hurt) hasSpeedLimit = false;
		
		if (hasSpeedLimit)
		{
			var maxMovespeed = movespeed * speedMultFinal;
			hsp = clamp(hsp,-maxMovespeed,maxMovespeed);
		}
		#endregion
		#endregion
		
		#region Hurt
		if (hurtState == hurtStates.hurt) parryEndTimer = 0;
		#endregion
		
		#region Parry
		with (obj_Enemy)
		{
			if ((canBeParried) and (distance_to_object(other) <= 8))
			{
				if (parryAttackIndex != -1)
				{
					other.attackIndex = parryAttackIndex;
					
					scr_MKSS_ParticleSet_ParryCircle(x,y);
					
					script_execute(global.MKSS_AttackList[other.attackIndex].executeAttackScript,other,id);
				}
				
				scr_PlaySfx(snd_MKSS_Parry);
				
				other.parryAttackBuffer = true;
				
				scr_SetGlobalFreezeFrame(8);
				
				other.attackMakeHeavyInvincible = true;
				other.parryEndTimer = 0;
				other.shakeX = 1;
				other.shakeY = 1;
				
				scr_MKSS_UI_BackgroundOverlay_Create(0);
				
				with (other.parryGhostParticle[0]) instance_destroy();
			}
		}
		
		with (obj_Attack)
		{
			if ((canBeParried) and (distance_to_object(other) <= 8))
			{
				if (parryAttackIndex != -1)
				{
					other.attackIndex = parryAttackIndex;
					
					scr_MKSS_ParticleSet_ParryCircle(x,y);
					
					script_execute(global.MKSS_AttackList[other.attackIndex].executeAttackScript,other,id);
				}
				
				scr_PlaySfx(snd_MKSS_Parry);
				
				other.parryAttackBuffer = true;
				
				scr_SetGlobalFreezeFrame(8);
				
				other.attackMakeHeavyInvincible = true;
				other.parryEndTimer = 0;
				other.shakeX = 1;
				other.shakeY = 1;
				
				scr_MKSS_UI_BackgroundOverlay_Create(0);
				
				with (other.parryGhostParticle[0]) instance_destroy();
			}
		}
		#endregion
		
		#region Parry Heavy Invin Timer
		if (parryHeavyInvinTimer != -1)
		{
			parryHeavyInvinTimer = max(parryHeavyInvinTimer - speedMultFinal,0);
			if (parryHeavyInvinTimer == 0)
			{
				attackMakeHeavyInvincible = false;
				
				parryHeavyInvinTimer = -1;
			}
		}
		#endregion
		
		#region Dodge
		var dodgeDir = (input_check_pressed("RT",playerNum)) - (input_check_pressed("LT",playerNum));
		
		if (dodgeDir != 0)
		{
			attackMakeFlash = false;
			flashTimer = -1;
			hsp = movespeedSlide * dodgeDir * speedMultFinal;
			if (!grounded)
			{
				hasJumpLimit = false;
				vsp = -((jumpspeed / 2) * speedMultFinal);
			}
			
			with (parryGhostParticle[0]) instance_destroy();
			
			scr_PlaySfx(snd_MKSS_RunBegin);
			
			scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
			
			scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Dodge_Step);
		}
		#endregion
				
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprParry;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
		
		#region Parry End Timer
		if (parryEndTimer != -1)
		{
			parryEndTimer = max(parryEndTimer - speedMultFinal,0);
			if (parryEndTimer == 0)
			{
				with (parryGhostParticle[0]) instance_destroy();
				
				canAttackCancelTargetState = false;
				scr_Player_CancelAttack(id,attackIndex);
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				
				parryEndTimer = -1;
			}
		}
		#endregion
	}
}