///@description Main

if (!localPause)
{
	#region Get Collected
	with (obj_Player)
	{
		if (place_meeting(x,y,other))
		{
			var healthPointsFinal = other.healthPoints;
			if (other.canMaxHeal) healthPointsFinal = global.playerMaxHp[playerNum];
			
			scr_MKSS_Player_Heal(playerNum,healthPointsFinal);
			
			scr_StageEntityTracker_Add(other);
			
			instance_destroy(other);
		}
	}
	#endregion
	
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
	
	#region Animation
	image_speed = speedMultFinal;
	#endregion
}
else
{
	image_speed = 0;
}