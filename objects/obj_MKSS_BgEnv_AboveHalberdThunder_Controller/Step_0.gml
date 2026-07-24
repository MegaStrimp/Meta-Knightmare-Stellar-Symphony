///@description Main

if (!localPause)
{
	#region Thunder Timer
	if (thunderTimer != -1)
	{
		thunderTimer = max(thunderTimer - speedMultFinal,0);
		if (thunderTimer == 0)
		{
			var sfx = scr_PlaySfx(choose(snd_MKSS_BgThunder1,snd_MKSS_BgThunder2,snd_MKSS_BgThunder3));
			audio_sound_pitch(sfx,random_range(.75,1.25));
			
			for (var i = 0; i < irandom_range(1,3); i++)
			{
				var targetX = irandom_range(camera_get_view_x(mainView) - spawnOffset,camera_get_view_x(mainView) + camera_get_view_width(mainView) + spawnOffset);
				var targetY = irandom_range(camera_get_view_y(mainView) - spawnOffset,camera_get_view_y(mainView) + camera_get_view_height(mainView) + spawnOffset);
				
				instance_create_depth(targetX,targetY,depth,obj_MKSS_BgEnv_AboveHalberdThunder);
			}
			
			thunderTimer = irandom_range(thunderTimerMin,thunderTimerMax);
		}
	}
	#endregion
}