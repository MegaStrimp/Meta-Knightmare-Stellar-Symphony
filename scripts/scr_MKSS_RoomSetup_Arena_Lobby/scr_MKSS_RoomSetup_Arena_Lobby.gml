///@description MKSS - Room Setup - Arena - Lobby

function scr_MKSS_RoomSetup_Arena_Lobby()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "arenaLobby"]);
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_CrystalSpace);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Arena Lobby",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}