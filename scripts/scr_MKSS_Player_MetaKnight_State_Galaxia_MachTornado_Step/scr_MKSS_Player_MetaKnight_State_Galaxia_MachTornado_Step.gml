///@description Player - Meta Knight - State - Galaxia - Mach Tornado - Step

function scr_MKSS_Player_MetaKnight_State_Galaxia_MachTornado_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		galaxia_MachTornado_EndTimer = attackCancelTimer;
		spawnEndAttack = true;
		
		attackMakeLightInvincible = true;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Decelerate
		hsp = scr_Entity_Friction(hsp,decel * speedMultFinal);
		#endregion
		
		#region Gravity
		scr_MKSS_Player_Component_Gravity(grav,,,true);
		#endregion
		
		#region Hurt
		if (hurtState == hurtStates.hurt)
		{
			spawnEndAttack = false;
			galaxia_MachTornado_EndTimer = 0;
		}
		#endregion
		
		#region Galaxia - Mach Tornado - End Timer
		if (galaxia_MachTornado_EndTimer != -1)
		{
			galaxia_MachTornado_EndTimer = max(galaxia_MachTornado_EndTimer - speedMultFinal,0);
			if (galaxia_MachTornado_EndTimer == 0)
			{
				#region End Attack
				if (spawnEndAttack)
				{
					with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = false;
						dmg = floor(MKSS_Base_GalaxiaDamage / 4);
						followOwner = true;
						canBreakBlocks = true;
						isMelee = true;
						canBeFinisher = true;
						destroyTimer = 5;
						freezeFrameForce = 3;
						knockbackAngle = 90;
						knockbackForce = 3;
						mask_index = spr_64x64Mask_MiddleOrigin;
						image_xscale = other.dirX;
						dirX = other.dirX;
						attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
					}
				}
				#endregion
				
				attackCancelTimer = 0;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				
				galaxia_MachTornado_EndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = -1;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}