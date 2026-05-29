///@description Main

if (!localPause)
{
	if (!isTwinkle)
	{
		#region Animation
		image_index = active;
		#endregion
	}
	
	if (!active)
	{
		#region Aura Timer
		if (auraTimer != -1)
		{
			auraTimer = max(auraTimer - speedMultFinal,0);
			if (auraTimer == 0)
			{
				hasAura = !hasAura;
			
				auraTimer = auraTimerMax;
			}
		}
		#endregion
	}
}