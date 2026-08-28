///@description Main

if (!localPause)
{
	#region Cannonball Timer
	if (cannonballTimer != -1)
	{
		cannonballTimer = max(cannonballTimer - speedMultFinal,0);
		if (cannonballTimer == 0)
		{
			cannonballCount += 1;
			
			switch (cannonballCount)
			{
				case 1:
				var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				scr_MKSS_ParticleSet_BlockBreak1(x,y,depth - 1);
				
				with (instance_create_depth(x,y,depth - 4,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					mask_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					hsp = 0;
					vsp = -4;
					destroyOutsideRoom = false;
					scr_MKSS_Attack_ChasseEmee_BigCannonball_Setup();
				}
				
				cannonballTimer = 15;
				break;
				
				case 2:
				var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				scr_MKSS_ParticleSet_BlockBreak1(x,y,depth - 1);
				
				with (instance_create_depth(x,y,depth - 4,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					mask_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					hsp = 1;
					vsp = -4;
					destroyOutsideRoom = false;
					scr_MKSS_Attack_ChasseEmee_BigCannonball_Setup();
				}
				
				cannonballTimer = 30;
				break;
				
				case 3:
				var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				scr_MKSS_ParticleSet_BlockBreak1(x,y,depth - 1);
				
				with (instance_create_depth(x,y,depth - 4,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					mask_index = spr_MKSS_Attack_ChasseEmee_BigCannonball_Background;
					hsp = -1;
					vsp = -4;
					destroyOutsideRoom = false;
					scr_MKSS_Attack_ChasseEmee_BigCannonball_Setup();
				}
				
				cannonballTimer = 120;
				break;
				
				case 4:
				var sfx = scr_PlaySfx(snd_MKSS_WaterOut);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				hsp = movespeed * speedMultFinal;
				
				particleTimer = particleTimerMax;
				cannonballTimer = -1;
				break;
			}
		}
	}
	#endregion
	
	#region Particle Timer
	if (particleTimer != -1)
	{
		particleTimer = max(particleTimer - speedMultFinal,0);
		if (particleTimer == 0)
		{
			scr_MKSS_ParticleSet_WaterWave1(x,y,depth + 1);
			
			particleTimer = particleTimerMax;
		}
	}
	#endregion
	
	#region Position
	scr_Component_SetPosition(hsp,vsp);
	#endregion
}