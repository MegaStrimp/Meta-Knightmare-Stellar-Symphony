///@description MKSS - Room Setup - Credits Screen

function scr_MKSS_RoomSetup_CreditsScreen()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "credits"]);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Credits Screen",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}