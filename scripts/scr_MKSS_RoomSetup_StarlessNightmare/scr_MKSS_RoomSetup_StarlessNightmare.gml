///@description MKSS - Room Setup - Starless Nightmare

function scr_MKSS_RoomSetup_StarlessNightmare()
{
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_StarlessNightmare);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("VS. Starless Nightmare",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}