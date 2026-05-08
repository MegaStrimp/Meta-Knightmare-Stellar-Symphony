///@description MKSS - Room Setup - Arena - Battle

function scr_MKSS_RoomSetup_Arena_Battle()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "arenaBattle"]);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Arena Battle",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}