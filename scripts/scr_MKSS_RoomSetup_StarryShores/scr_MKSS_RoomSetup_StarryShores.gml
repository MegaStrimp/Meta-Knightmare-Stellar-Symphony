///@description MKSS - Room Setup - Starry Shores

function scr_MKSS_RoomSetup_StarryShores()
{
	#region Music
	if (global.MKSS_WeaponList[global.MKSS_WeaponIDs[? "galaxia"]].isUnlocked) scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "starryShores"]);
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_StarryShores);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Starry Shores",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}