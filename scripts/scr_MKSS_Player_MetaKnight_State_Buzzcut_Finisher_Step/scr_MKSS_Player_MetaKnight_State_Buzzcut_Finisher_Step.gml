///@description Player - Meta Knight - State - Buzzcut - Finisher - Step

function scr_MKSS_Player_MetaKnight_State_Buzzcut_Finisher_Step()
{
	#region Variables
	var hasGigatorque = scr_MKSS_Player_CheckUpgrade(playerNum,"Buzzcut_Gigatorque");
	#endregion
	
	#region Setup
	if (playerState_Setup)
	{
		buzzcut_Finisher_State = 0;
		
		buzzcut_Finisher_StateTimer = 45;
		
		attackMakeLightInvincible = true;
		
		attackObj = -1;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Decelerate
		hsp = scr_Entity_Friction(hsp,(decel / (1 + (buzzcut_Finisher_State >= 1))) * speedMultFinal);
		#endregion
		
		#region Gravity
		scr_MKSS_Player_Component_Gravity();
		#endregion
		
		#region Cancel Attack
		switch (buzzcut_Finisher_State)
		{
			case 1:
			if (input_check_pressed("B",playerNum))
			{
				buzzcut_Finisher_State = 2;
				buzzcut_Finisher_StateTimer = 0;
			}
			break;
			
			case 3:
			case 4:
			if (input_check_pressed("A",playerNum))
			{
				buzzcut_Finisher_State = 3;
				buzzcut_Finisher_StateTimer = 0;
			}
			break;
			
			default:
			if (hurtState == hurtStates.hurt)
			{
				buzzcut_Finisher_State = 3;
				buzzcut_Finisher_StateTimer = 0;
			}
			break;
		}
		#endregion
		
		#region Buzzcut - Finisher - State Timer
		if (buzzcut_Finisher_StateTimer != -1)
		{
			buzzcut_Finisher_StateTimer = max(buzzcut_Finisher_StateTimer - speedMultFinal,0);
			if (buzzcut_Finisher_StateTimer == 0)
			{
				buzzcut_Finisher_State += 1;
				
				switch (buzzcut_Finisher_State)
				{
					case 1:
					var sfx = scr_PlaySfx(snd_MKSS_Slide);
					audio_sound_pitch(sfx,random_range(.85,1.15));
					
					scr_ChangeSprite(spriteSet.sprAttackBuzzcutFinisher,true);
					
					attackStopSpeedLimit = true;
					hsp = buzzcut_Finisher_Movespeed * dirX * speedMultFinal;
					
					attackObj = instance_create_depth(x,y,depth - 1,obj_MKSS_Attack);
					with (attackObj)
					{
						owner = other;
						isEnemy = false;
						dmg = floor(MKSS_Base_BuzzcutDamage / 2.5);
						bonusValue = MKSS_Base_AttackBonusValue;
						followOwner = true;
						followOwnerImageIndex = true;
						destroyIfOwnerNotAttack = true;
						canBreakBlocks = true;
						isMelee = true;
						isMultiHit = true;
						multiHitTimerMax = 4 - (hasGigatorque * 2);
						multiHitTimer = 0;
						enemyHurtTimerMult = 3;
						freezeFrameForce = 1;
						knockbackAngle = 45;
						if (other.dirX == -1) knockbackAngle = 135;
						knockbackForce = 1;
						//sprite_index = spr_MKSS_Attack_Buzzcut_Finisher_Mask;
						mask_index = spr_MKSS_Attack_Buzzcut_Finisher_Mask;
						image_xscale = other.dirX;
						dirX = other.dirX;
						attackAIBeginStep = scr_MKSS_Attack_Buzzcut_Finisher_BeginStep;
						attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
					}
					
					buzzcut_Finisher_StateTimer = 45;
					break;
					
					case 2:
					scr_ChangeSprite(spriteSet.sprAttackBuzzcutFinisherEnd1,true);
					
					if (attackObj != -1)
					{
						with (attackObj)
						{
							instance_destroy();
						}
					}
					
					buzzcut_Finisher_StateTimer = 45;
					break;
					
					case 3:
					var hasShrug = true;
					
					if (hasShrug)
					{
						scr_ChangeSprite(spriteSet.sprAttackBuzzcutFinisherEnd2,true);
						
						var sfx = scr_PlaySfx(snd_MKSS_BuzzcutSlash);
						audio_sound_pitch(sfx,random_range(.85,1.15));
						
						buzzcut_Finisher_StateTimer = 45;
						
						with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
						{
							owner = other;
							isEnemy = false;
							dmg = MKSS_Base_BuzzcutDamage;
							bonusValue = MKSS_Base_AttackBonusValue;
							followOwner = true;
							destroyIfOwnerNotAttack = true;
							pauseAfterAnimation = true;
							canBreakBlocks = true;
							isMelee = true;
							isMultiHit = true;
							multiHitTimerMax = 2;
							multiHitTimer = 0;
							enemyHurtTimerMult = 3;
							freezeFrameForce = 1;
							knockbackAngle = 0;
							if (other.dirX == -1) knockbackAngle = 180;
							knockbackForce = (other.buzzcut_Slash_Movespeed / 1.75);
							destroyTimer = other.buzzcut_Finisher_StateTimer;
							//sprite_index = spr_MKSS_Attack_Buzzcut_FinisherEnd_Mask;
							mask_index = spr_MKSS_Attack_Buzzcut_FinisherEnd_Mask;
							image_xscale = other.dirX;
							dirX = other.dirX;
							enemyHitBehavior = scr_MKSS_Attack_Buzzcut_FinisherEnd_EnemyHitBehavior;
							attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
						}
					}
					else
					{
						scr_ChangeSprite(spriteSet.sprWalk,true);
						
						attackCancelTimer = 0;
						
						scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
						
						buzzcut_Finisher_StateTimer = -1;
					}
					break;
					
					case 4:
					scr_ChangeSprite(spriteSet.sprWalk,true);
					attackCancelTimer = 0;
					
					scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
					
					buzzcut_Finisher_StateTimer = -1;
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