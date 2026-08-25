///@description Main

#region Alpha
alpha = lerp(alpha,1,.2);
#endregion

#region Circle
circleRadius = lerp(circleRadius,260,.1);
#endregion

#region Decals
decalLength = lerp(decalLength,decalLengthTarget,.1);
#endregion

#region Meta Points
if (pointTimer == -1)
{
	currentMetaPoints = lerp(currentMetaPoints,metaPointsTarget,.1);
	decreasedMetaPointsOffset = lerp(decreasedMetaPointsOffset,0,.2);
}
#endregion

#region Point Timer
if (pointTimer != -1)
{
	pointTimer = max(pointTimer - speedMultFinal,0);
	if (pointTimer == 0)
	{
		var sfx = scr_PlaySfx(snd_MKSS_Pop);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		var sfx = scr_PlaySfx(snd_MKSS_MetaPointCollect2);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		pointFlagTimer = 4;
		
		pointTimer = -1;
	}
}
#endregion

#region Point Flag Timer
if (pointFlagTimer != -1)
{
	pointFlagTimer = max(pointFlagTimer - speedMultFinal,0);
	if (pointFlagTimer == 0)
	{
		pointFlagTimer = -1;
	}
}
#endregion

#region Exit Timer
if (exitTimer != -1)
{
	exitTimer = max(exitTimer - speedMultFinal,0);
	if (exitTimer == 0)
	{
		global.MKSS_PlayerMetaPoints[playerNum] = metaPointsTarget;
		
		var targetRoomCheckpoint = global.roomCheckpoint;
		if (targetRoomCheckpoint == -1) targetRoomCheckpoint = room;
		scr_GoToRoom(targetRoomCheckpoint,false);
		
		exitTimer = -1;
	}
}
#endregion