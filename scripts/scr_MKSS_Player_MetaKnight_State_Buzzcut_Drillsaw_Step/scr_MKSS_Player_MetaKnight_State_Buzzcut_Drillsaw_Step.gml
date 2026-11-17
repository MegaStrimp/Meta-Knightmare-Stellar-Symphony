///@description Player - Meta Knight - State - Buzzcut - Drillsaw - Step

function scr_MKSS_Player_MetaKnight_State_Buzzcut_Drillsaw_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		buzzcut_Drillsaw_State = 0;
		
		buzzcut_Drillsaw_StateTimer = 45;
		
		attackMakeLightInvincible = true;
		
		attackObj = -1;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Decelerate
		hsp = scr_Entity_Friction(hsp,decel * speedMultFinal);
		#endregion
		
		#region Gravity
		scr_MKSS_Player_Component_Gravity();
		#endregion
		
		#region Cancel Attack
		if (hurtState == hurtStates.hurt)
		{
			buzzcut_Drillsaw_State = 1;
			buzzcut_Drillsaw_StateTimer = 0;
		}
		#endregion
		
		#region Buzzcut - Drillsaw - State Timer
		if (buzzcut_Drillsaw_StateTimer != -1)
		{
			buzzcut_Drillsaw_StateTimer = max(buzzcut_Drillsaw_StateTimer - speedMultFinal,0);
			if (buzzcut_Drillsaw_StateTimer == 0)
			{
				buzzcut_Drillsaw_State += 1;
				
				switch (buzzcut_Drillsaw_State)
				{
					case 1:
					var sfx = scr_PlaySfx(snd_MKSS_BuzzcutSlash);
					audio_sound_pitch(sfx,random_range(.85,1.15));
					
					scr_ChangeSprite(spriteSet.sprAttackBuzzcutDrillsaw,true);
					
					attackObj = instance_create_depth(x,y,depth - 1,obj_MKSS_Attack);
					with (attackObj)
					{
						owner = other;
						isEnemy = false;
						dmg = floor(MKSS_Base_BuzzcutDamage / 2.5);
						bonusValue = MKSS_Base_AttackBonusValue;
						canBreakBlocks = true;
						isMelee = true;
						isMultiHit = true;
						multiHitTimerMax = 4;
						multiHitTimer = 0;
						enemyHurtTimerMult = 3;
						freezeFrameForce = 1;
						knockbackAngle = 90 - (other.dirX * 90);
						if (other.dirX == -1) knockbackAngle = 135;
						knockbackForce = 1;
						sprite_index = spr_MKSS_Attack_Buzzcut_Chainlings;
						mask_index = spr_MKSS_Attack_Buzzcut_Chainlings;
						image_xscale = other.dirX;
						dirX = other.dirX;
						hsp = 0;
						vsp = 0;
						movespeed = 4;
						grav = .15;
						gravLimit = 2.5;
						particleTimerMax = 5;
						particleTimer = particleTimerMax;
						attackAIStep = scr_MKSS_Attack_Buzzcut_Drillsaw_Step;
						attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
					}
					
					buzzcut_Drillsaw_StateTimer = 45;
					break;
					
					case 2:
					scr_ChangeSprite(spriteSet.sprIdle,true);
					attackCancelTimer = 0;
					
					scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
					
					buzzcut_Drillsaw_StateTimer = -1;
					break;
				}
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}