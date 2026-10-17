///@description Player - Meta Knight - State - Buzzcut - Drillsaw - Step

function scr_MKSS_Player_MetaKnight_State_Buzzcut_Drillsaw_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		drillsawState = 0;
		buzzcut_Drillsaw_StateTimer = buzzcut_Drillsaw_StateTimerMax;
		buzzcut_Drillsaw_StateTimerMax = 20;
		buzzcut_Drillsaw_EndTimer = 300;
		buzzcut_Drillsaw_EndTimerMax = 20;
		
		attackMakeLightInvincible = true;
		hasImpactAttack = hasBlastPound;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Gravity
		var hasGravity = true;
		if ((hurtState == hurtStates.hurt)
		or (attackStopGravity)
		or (drillsawState == 0)) hasGravity = false;
		
		if (hasGravity) vsp = scr_Entity_Gravity(vsp,buzzcut_Drillsaw_Grav,buzzcut_Drillsaw_GravLimit,speedMultFinal);
		#endregion
		
		#region Hurt
		if (hurtState == hurtStates.hurt) buzzcut_Drillsaw_EndTimer = 0;
		#endregion
		
		#region Grounded
		if ((drillsawState == 1) and ((grounded) or ((floor(vsp) == 0) and (buzzcut_Drillsaw_EndTimer < 240))))
		{
			var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			scr_Camera_SetScreenshake(0,2);
			
			//scr_ChangeSprite(spriteSet.sprAttackBuzzcutDrillsawEnd,true);
			hasAttackAnimation = true;
			
			drillsawState = 2;
			buzzcut_Drillsaw_EndTimer = buzzcut_Drillsaw_EndTimerMax;
		}
		#endregion
		
		#region Buzzcut - Drillsaw - State Timer
		if (buzzcut_Drillsaw_StateTimer != -1)
		{
			buzzcut_Drillsaw_StateTimer = max(buzzcut_Drillsaw_StateTimer - speedMultFinal,0);
			if (buzzcut_Drillsaw_StateTimer == 0)
			{
				drillsawState += 1;
				
				switch (drillsawState)
				{
					case 1:
					with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = false;
						dmg = floor(MKSS_Base_BuzzcutDamage / 1.5);
						bonusValue = MKSS_Base_AttackBonusValue;
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
						sprite_index = spr_MKSS_Player_MetaKnight_Normal_Effects_Attack_Buzzcut_DownAttack;
						mask_index = spr_MKSS_Attack_Buzzcut_Drillsaw_Mask;
						image_xscale = other.dirX;
						dirX = other.dirX;
						attackAIEndStep = scr_MKSS_Attack_Buzzcut_Drillsaw_BeginStep;
						attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
					}
					
					buzzcut_Drillsaw_StateTimer = -1;
					break;
				}
			}
		}
		#endregion
		
		#region Buzzcut - Drillsaw - End Timer
		if (buzzcut_Drillsaw_EndTimer != -1)
		{
			buzzcut_Drillsaw_EndTimer = max(buzzcut_Drillsaw_EndTimer - speedMultFinal,0);
			if (buzzcut_Drillsaw_EndTimer == 0)
			{
				attackMakeLightInvincibleTimer = 15;
				attackCancelTimer = 0;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				
				buzzcut_Drillsaw_EndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		switch (drillsawState)
		{
			case 0:
			sprite_index = spriteSet.sprRoll;
			break;
			
			case 1:
			//sprite_index = spriteSet.sprAttackBuzzcutDrillsaw;
			break;
			
			case 2:
			//sprite_index = spriteSet.sprAttackBuzzcutDrillsawEnd;
			break;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}