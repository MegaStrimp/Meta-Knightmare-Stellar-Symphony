///@description Player - Meta Knight - State - Galaxia - Down Thrust - Step

function scr_MKSS_Player_MetaKnight_State_Galaxia_DownThrust_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		downThrustState = 0;
		galaxia_DownThrust_StateTimer = galaxia_DownThrust_StateTimerMax;
		galaxia_DownThrust_StateTimerMax = 20;
		galaxia_DownThrust_EndTimer = -1;
		galaxia_DownThrust_EndTimerMax = 20;
		
		attackMakeLightInvincible = true;
		hasImpactAttack = true; //STRIMPTODO IF HAS UPGRADE
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Gravity
		var hasGravity = true;
		if ((hurtState == hurtStates.hurt)
		or (attackStopGravity)
		or (downThrustState == 0)) hasGravity = false;
		
		if (hasGravity) vsp = scr_Entity_Gravity(vsp,galaxia_DownThrust_Grav,galaxia_DownThrust_GravLimit,speedMultFinal);
		#endregion
		
		#region Hurt
		if (hurtState == hurtStates.hurt) galaxia_DownThrust_EndTimer = 0;
		#endregion
		
		#region Grounded
		if ((downThrustState == 1) and (grounded))
		{
			scr_PlaySfx(snd_MKSS_BlockBreak);
			
			scr_Camera_SetScreenshake(0,2);
			
			scr_ChangeSprite(spriteSet.sprAttackGalaxiaDownThrustEnd,true);
			hasAttackAnimation = true;
			
			downThrustState = 2;
			galaxia_DownThrust_EndTimer = galaxia_DownThrust_EndTimerMax;
			
			if (hasImpactAttack)
			{
				scr_MKSS_ParticleSet_GroundHit1(x,y);
				
				with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = false;
					dmg = 3;
					destroyIfOwnerNotAttack = true;
					pauseAfterAnimation = true;
					canBreakBlocks = true;
					canBeFinisher = true;
					isMelee = false;
					freezeFrameForce = 2;
					enemyHurtTimerMult = 1.25;
					knockbackAngle = 90;
					knockbackForce = 2;
					destroyTimer = other.galaxia_DownThrust_EndTimer;
					mask_index = spr_MKSS_Attack_Galaxia_DownThrustEnd_Mask;
					image_xscale = other.dirX;
					dirX = other.dirX;
					attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_Impact;
				}
			}
		}
		#endregion
		
		#region Galaxia - Down Thrust - State Timer
		if (galaxia_DownThrust_StateTimer != -1)
		{
			galaxia_DownThrust_StateTimer = max(galaxia_DownThrust_StateTimer - speedMultFinal,0);
			if (galaxia_DownThrust_StateTimer == 0)
			{
				downThrustState += 1;
				
				switch (downThrustState)
				{
					case 1:
					with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = false;
						dmg = 3;
						followOwner = true;
						followOwnerImageIndex = true;
						destroyIfOwnerNotAttack = true;
						pauseAfterAnimation = true;
						canBreakBlocks = true;
						canBeFinisher = false;
						isMelee = true;
						freezeFrameForce = 2;
						enemyHurtTimerMult = 1.25;
						knockbackAngle = 270;
						knockbackForce = 2;
						sprite_index = spr_MKSS_Player_MetaKnight_Normal_Effects_Attack_Galaxia_DownAttack;
						mask_index = spr_MKSS_Attack_Galaxia_DownThrust_Mask;
						image_xscale = other.dirX;
						dirX = other.dirX;
						attackAIEndStep = scr_MKSS_Attack_Galaxia_DownThrust_BeginStep;
						attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
					}
					
					galaxia_DownThrust_StateTimer = -1;
					break;
				}
			}
		}
		#endregion
		
		#region Galaxia - Down Thrust - End Timer
		if (galaxia_DownThrust_EndTimer != -1)
		{
			galaxia_DownThrust_EndTimer = max(galaxia_DownThrust_EndTimer - speedMultFinal,0);
			if (galaxia_DownThrust_EndTimer == 0)
			{
				attackMakeLightInvincible = false;
				attackCancelTimer = 0;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				
				galaxia_DownThrust_EndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		switch (downThrustState)
		{
			case 0:
			sprite_index = spriteSet.sprRoll;
			break;
			
			case 1:
			sprite_index = spriteSet.sprAttackGalaxiaDownThrust;
			break;
			
			case 2:
			sprite_index = spriteSet.sprAttackGalaxiaDownThrustEnd;
			break;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}