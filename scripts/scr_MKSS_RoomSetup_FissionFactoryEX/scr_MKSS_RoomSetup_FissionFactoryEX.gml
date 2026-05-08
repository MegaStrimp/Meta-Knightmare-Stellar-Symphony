///@description MKSS - Room Setup - Fission Factory EX

function scr_MKSS_RoomSetup_FissionFactoryEX()
{
	#region Music
	//scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "fissionFactoryEX"]); STRIMPTODO
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_FissionFactoryEX);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Fission Factory EX",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}