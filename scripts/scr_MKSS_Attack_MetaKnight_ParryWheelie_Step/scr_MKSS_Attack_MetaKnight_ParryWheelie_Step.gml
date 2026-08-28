///@description MKSS - Attack - Meta Knight - Parry Wheelie - Step

function scr_MKSS_Attack_MetaKnight_ParryWheelie_Step()
{
	if (!localPause)
	{
		#region Movement
		hsp = movespeed * dirX * speedMultFinal;
		#endregion
		
		#region Gravity
		scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal)
		#endregion
		
		#region Particle Timer
		if (particleTimer != -1)
		{
			particleTimer = max(particleTimer - speedMultFinal,0);
			if (particleTimer == 0)
			{
				scr_MKSS_ParticleSet_Run(x + (8 * -dirX),y + 8,dirX);
				
				particleTimer = particleTimerMax;
			}
		}
		#endregion
		
		#region Afterimage Timer
		if (afterimageTimer != -1)
		{
			afterimageTimer = max(afterimageTimer - speedMultFinal,0);
			if (afterimageTimer == 0)
			{
				scr_MKSS_ParticleSet_Afterimage(,,,,,,,-1,0);
				
				afterimageTimer = afterimageTimerMax;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision(,XCollisionScript);
		#endregion
		
		#region Destroy
		if (destroyFlag)
		{
			var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			scr_MKSS_ParticleSet_Explosion2(x,y);
			
			with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
			{
				owner = other.owner;
				isEnemy = false;
				dmg = floor(MKSS_Base_PlayerContactDamage * 1.5);
				bonusValue = MKSS_Base_AttackBonusValue;
				canBreakBlocks = true;
				destroyTimer = 5;
				freezeFrameForce = 1;
				mask_index = spr_64x64Mask_MiddleOrigin;
				image_xscale = other.dirX;
				dirX = other.dirX;
				ds_list_add(attackTypes,global.AttackTypeIDs[? "fire"]);
				attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
			}
			
			destroyTimer = 0;
			
			destroyFlag = false;
		}
		#endregion
	}
}