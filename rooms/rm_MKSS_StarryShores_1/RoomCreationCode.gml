///@description Room Creation Code

#region Begin Stage
if (!global.inStage) scr_MKSS_Stage_Begin("starryShores");
#endregion

#region Room Setup
script_execute(scr_MKSS_RoomSetup_StarryShores);
#endregion

#region Intro Cutscene
if (!global.MKSS_WeaponList[global.MKSS_WeaponIDs[? "galaxia"]].isUnlocked)
{
	with (instance_create_layer(0,0,"Instances",obj_MKSS_Cutscene))
	{
		scr_MKSS_Cutscene_Preset_StarryShoresIntro();
	}
}
#endregion