///@description MKSS - Room Setup - Living Loom EX

function scr_MKSS_RoomSetup_LivingLoomEX()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "livingLoomEX"]);
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_LivingLoomEX);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Living Loom EX",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}