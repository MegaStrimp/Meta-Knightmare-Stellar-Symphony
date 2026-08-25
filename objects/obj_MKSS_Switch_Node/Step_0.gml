/// @description Main

if (!localPause)
{
	#region Destroy Timer
	if (destroyTimer != -1)
	{
		destroyTimer = max(destroyTimer - speedMultFinal,0);
		if (destroyTimer == 0)
		{
			var sfx = scr_PlaySfx(snd_MKSS_Chain);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			scr_MKSS_ParticleSet_Explosion3(x,y);
			
			scr_MKSS_Switch_Node_Destroy();
			if (activationScript != -1) script_execute(activationScript);
			
			instance_destroy();
			
			destroyTimer = -1;
		}
	}
	#endregion
}