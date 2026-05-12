///@description MKSS - Room Setup - Title Screen

function scr_MKSS_RoomSetup_TitleScreen()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "title"]);
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_TitleScreen);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Title Screen",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}