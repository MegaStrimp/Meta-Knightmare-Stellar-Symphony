///@description Room Creation Code

#region Halberd Theme
switch (global.MKSS_HalberdThemeProgression)
{
	case 0:
	global.MKSS_HalberdTheme = global.MKSS_MusicIDs[? "battleshipHalberd_1"];
	break;
	
	case 1:
	global.MKSS_HalberdTheme = global.MKSS_MusicIDs[? "battleshipHalberd_1"];
	break;
	
	default:
	global.MKSS_HalberdTheme = choose(global.MKSS_MusicIDs[? "battleshipHalberd_1"],global.MKSS_MusicIDs[? "battleshipHalberd_2"]);
	break;
}
#endregion

#region Room Setup
script_execute(scr_MKSS_RoomSetup_BattleshipHalberd);
#endregion