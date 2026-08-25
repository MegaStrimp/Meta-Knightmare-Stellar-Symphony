///@description MKSS - Attack - Starless Marx - Seed - Step

function scr_MKSS_Attack_StarlessMarx_Seed_Step()
{
	if (!localPause)
	{
		#region Seed Plant
		if (growTimer != -1)
		{
			growTimer = max(growTimer - speedMultFinal,0);
			if (growTimer == 0)
			{
				var sfx = scr_PlaySfx(snd_MKSS_MarxVine);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				scr_MKSS_ParticleSet_Common(x,y - 8,spr_MKSS_Particle_VineEffect1,-2);
				
				with (instance_create_depth(x,y - 8,depth - 1,obj_MKSS_Attack))
				{
					owner = other.owner;
					isEnemy = true;
					dmg = other.dmgTarget;
					knockbackForce = 1;
					sprite_index = spr_MKSS_Attack_StarlessMarx_Vine;
					mask_index = spr_MKSS_Attack_StarlessMarx_Vine;
					destroyOutsideRoom = false;
					destroyAfterCollideWall = false;
					pauseOutsideView = false;
					scr_MKSS_Attack_StarlessMarx_Vine_Setup();
					growLimit = 16;
				}
				
				instance_destroy();
			}
		}
		else
		{
			if (instance_place(x,y,obj_Wall))
			{
				var sfx = scr_PlaySfx(snd_MKSS_MarxSeedImpact);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				image_alpha = 0;
				
				vsp = 0;
				
				scr_MKSS_ParticleSet_Common(x,y,spr_MKSS_Particle_SeedImpact);
			
				growTimer = growTimerMax;
			}
		}
		#endregion
		
		#region Position
		if (growTimer == -1) vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}