///@description Main

if (!localPause)
{
	#region Float
	y += sine_wave(global.currentTimePausable / 1500,.1,.05,0) * speedMultFinal;
	#endregion
	
	#region Get Collected
	with (obj_Player)
	{
		if (place_meeting(x,y,other))
		{
			global.flag_MKSS_MetaPointCollect = true;
			
			global.MKSS_PlayerMetaPoints[playerNum] += other.points;
			global.MKSS_PlayerMetaPoints[playerNum] = min(global.MKSS_PlayerMetaPoints[playerNum],9999);
			
			metaPointFlashTimer = metaPointFlashTimerMax;
			
			scr_MKSS_ParticleSet_MetaPointCollect(other.x,other.y,other.pointSize);
			
			scr_MKSS_Score_Add(other.scorePoints);
			
			instance_destroy(other);
		}
	}
	#endregion
	
	#region Trail Timer
	if (trailTimer != -1)
	{
		trailTimer = max(trailTimer - speedMultFinal,0);
		if (trailTimer == 0)
		{
			scr_MKSS_ParticleSet_MetaPointTrail(x,y,pointSize);
			trailTimer = trailTimerMax;
		}
	}
	#endregion
}
	
#region Animation
image_speed = 1 * speedMultFinal * !localPause;
#endregion