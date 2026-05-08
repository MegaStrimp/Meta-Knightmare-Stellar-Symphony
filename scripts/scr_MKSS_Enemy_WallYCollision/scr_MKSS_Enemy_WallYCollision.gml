///@description MKSS - Enemy - Wall Y Collision

function scr_MKSS_Enemy_WallYCollision()
{
	#region Knockback At Wall
	if (hasKnockback)
	{
		grounded = false;
		
		if (abs(vsp) >= 2)
		{
			var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			scr_Camera_SetScreenshake(1,1);
			
			var targetYOffset = 8;
			scr_MKSS_ParticleSet_WallHit(x,y - (targetYOffset * dirY));
			
			shakeX = 1;
			shakeY = 1;
			
			localFreezeFrameTimer = 2;
			
			vspFinal = abs(vsp) * sign(vsp) * -.75 * speedMultFinal;
		}
		
		if (abs(vsp) >= 4)
		{
			var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			scr_Camera_SetScreenshake(1,1);
			
			var targetYOffset = 8;
			scr_MKSS_ParticleSet_WallHit(x,y - (targetYOffset * dirY));
			
			shakeX = 1;
			shakeY = 1;
			
			localFreezeFrameTimer = 4;
			
			vspFinal = abs(vsp) * sign(vsp) * -.75 * speedMultFinal;
		}
	}
	else
	{
		vspFinal = 0;
	}
	#endregion
}