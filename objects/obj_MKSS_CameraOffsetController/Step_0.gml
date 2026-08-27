///@description Main

#region Update Offsets
if (!localPause)
{
	xOffset = lerp(xOffset,targetXOffset,.05);
	yOffset = lerp(yOffset,targetYOffset,.05);
}

scr_Camera_UpdateOffsets(xOffset,yOffset);
#endregion