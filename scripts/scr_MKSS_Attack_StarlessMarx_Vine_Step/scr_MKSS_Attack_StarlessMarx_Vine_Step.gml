///@description MKSS - Attack - Starless Marx - Seed - Step

function scr_MKSS_Attack_StarlessMarx_Vine_Step()
{
	if (!localPause)
	{
		#region Vine
		if (growTimer != -1) and (growLimit > 0)
		{
			growTimer = max(growTimer - speedMultFinal,0);
			if (growTimer == 0)
			{
				var sfx = scr_PlaySfx(snd_MKSS_MarxVine);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				var _x = choose(0,irandom_range(-3,3));
				scr_MKSS_ParticleSet_Common(x + _x,y - 16,spr_MKSS_Particle_VineEffect1,-2);
				
				with (instance_create_depth(x + _x,y - 16,depth - 1,obj_MKSS_Attack))
				{
					owner = other.owner;
					isEnemy = true;
					dmg = other.dmg;
					knockbackForce = 1;
					sprite_index = spr_MKSS_Attack_StarlessMarx_Vine;
					mask_index = spr_MKSS_Attack_StarlessMarx_Vine;
					destroyOutsideRoom = false;
					destroyAfterCollideWall = false;
					pauseOutsideView = false;
					scr_MKSS_Attack_StarlessMarx_Vine_Setup();
					growLimit = other.growLimit - 1;
				}
				
				growTimer = -1;
			}
		}
		#endregion
		
		#region Destroy
		if (vineDestroyTimer != -1)
		{
			vineDestroyTimer = max(vineDestroyTimer - speedMultFinal,0);
			if (vineDestroyTimer == 0)
			{
				scr_MKSS_ParticleSet_Common(x,y,spr_MKSS_Particle_VineEffect2,-2);
				
				instance_destroy();
			}
		}
		#endregion
	}
}