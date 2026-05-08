///@description MKSS - Room Setup - Battleship Halberd

function scr_MKSS_RoomSetup_BattleshipHalberd()
{
	#region Music
	if (global.MKSS_HalberdTheme != -1) scr_MKSS_Music_Play(global.MKSS_HalberdTheme);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Battleship Halberd",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}