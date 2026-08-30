///@description Player - Meta Knight - State - Galaxia - Multisword - Step

function scr_MKSS_Player_MetaKnight_State_Galaxia_Multisword_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		galaxia_Multisword_ShootCount = 0;
		
		galaxia_Multisword_ShootTimer = 0;
		galaxia_Multisword_ShootTimerMax = 5;
		
		galaxia_Multisword_EndTimer = attackCancelTimer;
		
		attackMakeLightInvincible = true;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		hsp = (movespeedNormal / 3) * -dirX * speedMultFinal;
		#endregion
		
		#region Gravity
		scr_MKSS_Player_Component_Gravity();
		#endregion
		
		#region Hurt
		if (hurtState == hurtStates.hurt) galaxia_Multisword_EndTimer = 0;
		#endregion
		
		#region Galaxia - Multisword - Shoot Timer
		if (galaxia_Multisword_ShootTimer != -1)
		{
			galaxia_Multisword_ShootTimer = max(galaxia_Multisword_ShootTimer - speedMultFinal,0);
			if (galaxia_Multisword_ShootTimer == 0)
			{
				var sfx = scr_PlaySfx(snd_MKSS_Slash1);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				image_index = 0;
				
				var shootDir = 0;
				switch (galaxia_Multisword_ShootCount)
				{
					case 0:
					case 2:
					shootDir = 0;
					break;
					
					case 1:
					shootDir = -1;
					break;
					
					case 3:
					shootDir = 1;
					break;
				}
				
				galaxia_Multisword_ShootCount = (galaxia_Multisword_ShootCount + 1) % 4;
				
				with (instance_create_depth(x + (12 * dirX),y + (4 * shootDir),depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = false;
					dmg = floor(MKSS_Base_GalaxiaDamage / 4);
					bonusValue = MKSS_Base_AttackBonusValue;
					destroyAfterCollideWall = true;
					destroyAfterHit = true;
					canBreakBlocks = true;
					freezeFrameForce = 1;
					hsp = 8 * other.dirX * speedMultFinal;
					vsp = 0;
					knockbackForce = 0;
					sprite_index = spr_MKSS_Attack_Galaxia_Multisword;
					mask_index = spr_MKSS_Attack_Galaxia_Multisword_Mask;
					image_xscale = other.dirX;
					dirX = other.dirX;
					attackAIStep = scr_MKSS_Attack_Galaxia_Multisword_Step;
					attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
				}
				
				galaxia_Multisword_ShootTimer = galaxia_Multisword_ShootTimerMax;
			}
		}
		#endregion
		
		#region Galaxia - Multisword - End Timer
		if (galaxia_Multisword_EndTimer != -1)
		{
			galaxia_Multisword_EndTimer = max(galaxia_Multisword_EndTimer - speedMultFinal,0);
			if (galaxia_Multisword_EndTimer == 0)
			{
				attackCancelTimer = 0;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				
				galaxia_Multisword_EndTimer = -1;
			}
		}
		#endregion
		
		#region Attack
		if (currentAbility != -1)
		{
			script_execute(global.MKSS_WeaponList[currentAbility].baseScript);
		}
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprAttackGalaxiaMultisword;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}