///@description Room Creation Code

#region Halberd Theme
switch (global.MKSS_HalberdThemeProgression) //STRIMPTODO 1 after Andy 1
{
	case 0:
	global.MKSS_HalberdTheme = global.MKSS_MusicIDs[? "battleshipHalberd_1"];
	break;
	
	case 1:
	global.MKSS_HalberdTheme = global.MKSS_MusicIDs[? "battleshipHalberd_2"];
	break;
	
	default:
	global.MKSS_HalberdTheme = choose(global.MKSS_MusicIDs[? "battleshipHalberd_1"],global.MKSS_MusicIDs[? "battleshipHalberd_2"]);
	break;
}
#endregion

#region Room Setup
script_execute(scr_MKSS_RoomSetup_BattleshipHalberd);
#endregion

#region Intro Cutscene
if (!global.MKSS_CutsceneStatus_HalberdIntro)
{
	with (instance_create_layer(0,0,"Instances",obj_MKSS_Cutscene))
	{
		scr_MKSS_Cutscene_Preset_HalberdIntro();
	}
	
	global.MKSS_CutsceneStatus_HalberdIntro = true;
	scr_MKSS_SaveData(global.selectedSave);
}
#endregion

#region Crossover Notifs
var notifID = global.MKSS_NotifIDs[? "crossover_KSWFamiliar"];
if (global.MKSS_NotifList[notifID].unlockScript()) scr_MKSS_ObtainNotif(notifID);

var notifID = global.MKSS_NotifIDs[? "crossover_WaddleKnightFamiliar"];
if (global.MKSS_NotifList[notifID].unlockScript()) scr_MKSS_ObtainNotif(notifID);
#endregion