///@description Main

if (!localPause)
{
	#region Color Timer
	if (colorTimer != -1)
	{
		colorTimer = max(colorTimer - speedMultFinal,0);
		if (colorTimer == 0)
		{
			colorListIndex = (colorListIndex + 1 + array_length(colorList)) % array_length(colorList);
			
			colorTimer = colorTimerMax;
		}
	}
	#endregion
	
	#region Destroy Timer
	if (destroyTimer != -1)
	{
		destroyTimer = max(destroyTimer - speedMultFinal,0);
		if (destroyTimer == 0)
		{
			instance_destroy();
			
			destroyTimer = -1;
		}
	}
	#endregion
}