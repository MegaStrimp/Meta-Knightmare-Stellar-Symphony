///@description MKSS - Room Setup - Royal Reeve EX

function scr_MKSS_RoomSetup_RoyalReeveEX()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "royalReeveEX"]);
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_RoyalReeveEX);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Royal Reeve EX",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}