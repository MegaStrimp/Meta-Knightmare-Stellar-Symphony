///@description MKSS - Room Setup - Starry Shores EX

function scr_MKSS_RoomSetup_StarryShoresEX()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "starryShoresEX"]);
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_StarryShoresEX);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Starry Shores EX",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}