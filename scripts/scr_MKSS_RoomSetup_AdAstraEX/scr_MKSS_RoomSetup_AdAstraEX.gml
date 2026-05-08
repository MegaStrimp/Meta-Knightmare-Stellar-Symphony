///@description MKSS - Room Setup - Ad Astra EX

function scr_MKSS_RoomSetup_AdAstraEX()
{
	#region Music
	//scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "adAstraEX"]); STRIMPTODO
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_AdAstraEX);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Ad Astra EX",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}