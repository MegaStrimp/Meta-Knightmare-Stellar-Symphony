///@description Main

#region Selection
if (input_check_pressed("B",playerNum))
{
	with (obj_FrameworkControl)
	{
		MKSS_GamePause_Locked = false;
		
		MKSS_GamePause_PauseButtonAlphaTarget = 1;
		
		MKSS_GamePause_CircleZoomTarget = 1;
	}
	
	instance_destroy();
}
#endregion

#region Movement
for (var i = 0; i < ds_list_size(constellationList); i++)
{
	constellationOffsets[i].x = sine_wave(current_time / constellationOffsets[i].wave,1,2,0);
	constellationOffsets[i].y = sine_wave(current_time / (constellationOffsets[i].wave + 500),.7,3,0);
}
#endregion