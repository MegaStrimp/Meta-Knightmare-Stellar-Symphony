///@description MKSS - Room Setup - Fission Factory

function scr_MKSS_RoomSetup_FissionFactory()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "fissionFactory"]);
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_FissionFactory);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Fission Factory",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}