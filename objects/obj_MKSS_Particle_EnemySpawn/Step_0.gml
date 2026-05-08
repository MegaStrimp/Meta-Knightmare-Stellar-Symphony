///@description Main

if (!localPause)
{
	#region Particle Timer
	if (particleTimer != -1)
	{
		particleTimer = max(particleTimer - speedMultFinal,0);
		if (particleTimer == 0)
		{
			scr_MKSS_ParticleSet_EnemyHitStars(x + irandom_range(-8,8),y + irandom_range(-8,8),false);
			
			particleTimer = particleTimerMax;
		}
	}
	#endregion
	
	#region Destroy Timer
	if (destroyTimer != -1)
	{
		destroyTimer = max(destroyTimer - speedMultFinal,0);
		if (destroyTimer == 0)
		{
			audio_stop_sound(sound);
			
			var sfx = scr_PlaySfx(snd_MKSS_EnemySpawner_End);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			scr_MKSS_ParticleSet_Circle1(x,y);
			
			instance_destroy();
			
			destroyTimer = -1;
		}
	}
	#endregion
}