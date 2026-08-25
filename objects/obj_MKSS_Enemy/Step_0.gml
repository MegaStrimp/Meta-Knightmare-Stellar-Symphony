///@description Main

#region Event Inherited
event_inherited();
#endregion

if (!localPause)
{
	#region Stun Cancel Timer
	if (stunCancelTimer != -1)
	{
		stunCancelTimer = max(stunCancelTimer - speedMultFinal,0);
		if (stunCancelTimer == 0)
		{
			stunCancelTimer = -1;
		}
	}
	#endregion
	
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
	
	#region Water
	var inWaterPrev = inWater;
	
	inWater = place_meeting(x,y,obj_Water);
	
	if (inWaterPrev != inWater)
	{
		var sfx = scr_PlaySfx(snd_MKSS_WaterOut);
		audio_sound_pitch(sfx,random_range(.85,1.15));
	}
	#endregion
}