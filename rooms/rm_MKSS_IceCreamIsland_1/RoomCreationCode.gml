///@description Room Creation Code

#region Begin Stage
if (!global.inStage) scr_MKSS_Stage_Begin("iceCreamIsland");
#endregion

#region Room Setup
script_execute(scr_MKSS_RoomSetup_IceCreamIsland);
#endregion

#region Intro Cutscene
if (!global.MKSS_StageList[global.MKSS_StageIDs[? "iceCreamIsland"]].isBeaten)
{
	with (instance_create_layer(0,0,"Instances",obj_MKSS_Cutscene))
	{
		scr_MKSS_Cutscene_Preset_TutorialIntro();
	}
}
#endregion