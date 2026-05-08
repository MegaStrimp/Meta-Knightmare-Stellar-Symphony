///@description MKSS - Room Setup - Disclaimer Screen

function scr_MKSS_RoomSetup_DisclaimerScreen()
{
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_StarryShores);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Disclaimer Screen",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}