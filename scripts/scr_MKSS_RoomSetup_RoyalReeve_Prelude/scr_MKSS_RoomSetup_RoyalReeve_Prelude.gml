///@description MKSS - Room Setup - Royal Reeve - Prelude

function scr_MKSS_RoomSetup_RoyalReeve_Prelude()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "prelude"]);
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_RoyalReeve);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Royal Reeve",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}