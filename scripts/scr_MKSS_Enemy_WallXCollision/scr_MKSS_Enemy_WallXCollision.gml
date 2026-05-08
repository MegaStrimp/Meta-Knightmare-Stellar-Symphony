///@description MKSS - Enemy - Wall X Collision

function scr_MKSS_Enemy_WallXCollision()
{
	#region Knockback At Wall
	if (hasKnockback)
	{
		dirX = -sign(hsp);
		
		if (abs(hsp) >= 1)
		{
			var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			scr_Camera_SetScreenshake(1,1);
			
			var targetXOffset = sprite_get_width(mask_index) / 2;
			scr_MKSS_ParticleSet_WallHit(x - (targetXOffset * dirX),y);
			
			shakeX = 1;
			shakeY = 1;
			
			localFreezeFrameTimer = 7;
		}
		
		if (abs(hsp) >= 3)
		{
			var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			scr_Camera_SetScreenshake(1,1);
			
			var targetXOffset = sprite_get_width(mask_index) / 2;
			scr_MKSS_ParticleSet_WallHit(x - (targetXOffset * dirX),y);
			
			shakeX = 1;
			shakeY = 1;
			
			localFreezeFrameTimer = 15;
		}
		
		hspFinal = hsp * -.75 * speedMultFinal;
	}
	else
	{
		hspFinal = 0;
	}
	#endregion
}