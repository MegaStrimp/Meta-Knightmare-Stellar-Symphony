///@description Main

if (!localPause)
{
	#region Increase Speed
	spd = lerp(spd,spdTarget,.2);
	#endregion
	
	#region Move At Angle
	if (!changeSpd)
	{
		x += lengthdir_x(spd,angle);
		y += lengthdir_y(spd,angle);
	}
	#endregion
	
	if (chaseTimer != -1)
	{
		#region Chase Timer
		chaseTimer = max(chaseTimer - speedMultFinal,0);
		if (chaseTimer == 0)
		{
			spdTarget = 0;
			spdMax += 2;
			chaseTimer = -1;
		}
		#endregion
	}
	else
	{
		#region Change Speed
		if (abs(spd) <= 1) changeSpd = true; 
		#endregion
		
		if (changeSpd)
		{
			#region Increase Speed Target
			spdTarget = lerp(spdTarget,spdMax,.05);
			#endregion
			
			#region Chase Player
			if ((targetPlayer != -1) and (instance_exists(targetPlayer))) move_towards_point(targetPlayer.x,targetPlayer.y,spd);
			#endregion
		}
	}
	
	if (collectTimer != -1)
	{
		#region Collect Timer
		collectTimer = max(collectTimer - speedMultFinal,0);
		if (collectTimer == 0)
		{
			collectTimer = -1;
		}
		#endregion
	}
	else
	{
		#region Get Collected
		if (targetPlayer != -1)
		{
			with (targetPlayer)
			{
				if (place_meeting(x,y,other))
				{
					global.flag_MKSS_MetaPointCollect = true;
					
					global.MKSS_PlayerMetaPoints[playerNum] += other.points;
					global.MKSS_PlayerMetaPoints[playerNum] = min(global.MKSS_PlayerMetaPoints[playerNum],9999);
					
					metaPointFlashTimer = metaPointFlashTimerMax;
					
					scr_MKSS_ParticleSet_MetaPointCollect(other.x,other.y,other.pointSize);
					
					instance_destroy(other);
				}
			}
		}
		#endregion
	}
	
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
	
	#region Animation
	image_speed = 1 * speedMultFinal;
	#endregion
}
else
{
	speed = 0;
	image_speed = 0;
}