///@description Room End

#region Get Collected
with (targetPlayer)
{
	if (place_meeting(x,y,other))
	{
		global.MKSS_PlayerMetaPoints[playerNum] += other.points;
		global.MKSS_PlayerMetaPoints[playerNum] = min(global.MKSS_PlayerMetaPoints[playerNum],9999);
		
		instance_destroy(other);
	}
}
#endregion