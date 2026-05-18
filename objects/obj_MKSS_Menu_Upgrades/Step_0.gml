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
	
	scr_MKSS_Player_GetUnlockedUpgrades(0);
	
	instance_destroy();
}
#endregion

#region Movement
for (var i = 0; i < ds_list_size(constellationList); i++)
{
	constellationOffsets[i].x = sine_wave(current_time / constellationOffsets[i].wave,1,1.5,0);
	constellationOffsets[i].y = sine_wave(current_time / (constellationOffsets[i].wave + 500),.7,2.5,0);
}
#endregion

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion