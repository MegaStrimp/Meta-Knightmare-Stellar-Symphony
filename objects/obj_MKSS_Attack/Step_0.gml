///@description Main

#region Event Inherited
event_inherited();
#endregion

if (!localPause)
{
	#region Parriable Particle Timer
	if (canBeParried)
	{
		if (parriableParticleTimer == -1) parriableParticleTimer = parriableParticleTimerMax;
		
		if (parriableParticleTimer != -1)
		{
			parriableParticleTimer = max(parriableParticleTimer - speedMultFinal,0);
			if (parriableParticleTimer == 0)
			{
				scr_MKSS_ParticleSet_Parriable(x,y);
			
				parriableParticleTimer = -1;
			}
		}
	}
	else
	{
		parriableParticleTimer = -1;
	}
	#endregion
}