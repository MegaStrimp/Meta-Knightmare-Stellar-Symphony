///@description Player - Meta Knight - State - Buzzcut - Chainlings - Step

function scr_MKSS_Player_MetaKnight_State_Buzzcut_Chainlings_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		buzzcut_Chainlings_ShootTimer = 0;
		buzzcut_Chainlings_ShootTimerMax = 10;
		
		buzzcut_Chainlings_EndTimer = attackCancelTimer;
		
		buzzcut_Chainlings_ShootCount = 0;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Gravity
		scr_MKSS_Player_Component_Gravity();
		#endregion
		
		#region Hurt
		if (hurtState == hurtStates.hurt) buzzcut_Chainlings_EndTimer = 0;
		#endregion
		
		#region Buzzcut - Chainlings - Shoot Timer
		if (buzzcut_Chainlings_ShootTimer != -1)
		{
			buzzcut_Chainlings_ShootTimer = max(buzzcut_Chainlings_ShootTimer - speedMultFinal,0);
			if (buzzcut_Chainlings_ShootTimer == 0)
			{
				buzzcut_Chainlings_ShootCount += 1;
				
				if (buzzcut_Chainlings_ShootCount == 1)
				{
					var targetAngle = 270 + (70 * dirX);
					
					with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = false;
						dmg = floor(MKSS_Base_BuzzcutDamage * 3);
						destroyAfterCollideWall = true;
						destroyAfterHit = true;
						canBreakBlocks = true;
						freezeFrameForce = 1;
						hsp = lengthdir_x(4 * speedMultFinal,targetAngle);
						vsp = lengthdir_y(4 * speedMultFinal,targetAngle);
						knockbackAngle = targetAngle;
						knockbackForce = 1;
						sprite_index = spr_24x24Mask_MiddleOrigin;
						mask_index = spr_24x24Mask_MiddleOrigin;
						image_xscale = other.dirX;
						dirX = other.dirX;
						attackAIStep = scr_MKSS_Attack_Buzzcut_Chainlings_Step;
						attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
					}
					
					buzzcut_Chainlings_ShootTimer = buzzcut_Chainlings_ShootTimerMax;
				}
				else
				{
					var targetAngle = 270 - (70 * dirX);
					
					with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = false;
						dmg = floor(MKSS_Base_BuzzcutDamage * 3);
						destroyAfterCollideWall = true;
						destroyAfterHit = true;
						canBreakBlocks = true;
						freezeFrameForce = 1;
						hsp = lengthdir_x(4 * speedMultFinal,targetAngle);
						vsp = lengthdir_y(4 * speedMultFinal,targetAngle);
						knockbackAngle = targetAngle;
						knockbackForce = 1;
						sprite_index = spr_24x24Mask_MiddleOrigin;
						mask_index = spr_24x24Mask_MiddleOrigin;
						image_xscale = other.dirX;
						dirX = other.dirX;
						attackAIStep = scr_MKSS_Attack_Buzzcut_Chainlings_Step;
						attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
					}
					
					buzzcut_Chainlings_ShootTimer = -1;
				}
			}
		}
		#endregion
		
		#region Buzzcut - Chainlings - End Timer
		if (buzzcut_Chainlings_EndTimer != -1)
		{
			buzzcut_Chainlings_EndTimer = max(buzzcut_Chainlings_EndTimer - speedMultFinal,0);
			if (buzzcut_Chainlings_EndTimer == 0)
			{
				attackCancelTimer = 0;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				
				buzzcut_Chainlings_EndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprAttackBuzzcutChainlings;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}