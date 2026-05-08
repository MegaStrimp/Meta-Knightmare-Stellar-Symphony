///@description Main

if (!localPause)
{
	if (isActive)
	{
		#region Deactivate
		if (global.MKSS_WeaponList[global.MKSS_WeaponIDs[? "galaxia"]].isUnlocked) isActive = false;
		#endregion
	}
	else
	{
		#region Movement
		if (!showTitle)
		{
			scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "starryShores"]);
			
			showTitle = true;
		}
		
		xLimit -= spd;
		
		if ((xLimit <= -8) and (destroyTimer == -1))
		{
			xLimit = -8;
			spd = 0;
			destroyTimer = destroyTimerMax;
		}
		#endregion
	}
	
	#region Destroy Timer
	if (destroyTimer != -1)
	{
		destroyTimer = max(destroyTimer - speedMultFinal,0);
		if (destroyTimer == 0)
		{
			global.hasHud = true;
			instance_destroy();
			
			destroyTimer = -1;
		}
	}
	#endregion
}