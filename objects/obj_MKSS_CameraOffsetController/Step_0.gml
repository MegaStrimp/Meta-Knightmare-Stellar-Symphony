///@description Main

if (!localPause)
{
	#region Update Offsets
	scr_Camera_UpdateOffsets(xOffset,yOffset);
	
	xOffset = lerp(xOffset,targetXOffset,.05);
	yOffset = lerp(yOffset,targetYOffset,.05);
	#endregion
}