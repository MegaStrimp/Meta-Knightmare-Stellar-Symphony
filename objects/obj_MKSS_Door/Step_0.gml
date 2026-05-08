///@description Main

#region Event Inherited
event_inherited();
#endregion

if (!localPause)
{
	#region Big Star
	bigStarIndex = (bigStarIndex + bigStarSpeed + bigStarNumber) % bigStarNumber;
	#endregion
	
	#region Particle Timer
	if (particleTimer != -1)
	{
		particleTimer = max(particleTimer - speedMultFinal,0);
		if (particleTimer == 0)
		{
			scr_MKSS_ParticleSet_DoorStar1(x + 8,y,particleDir);
			particleDir *= -1;
			
			particleTimer = particleTimerMax;
		}
	}
	#endregion
}