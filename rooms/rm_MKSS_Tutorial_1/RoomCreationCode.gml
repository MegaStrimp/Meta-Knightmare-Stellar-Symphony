///@description Room Creation Code

#region Begin Stage
scr_MKSS_Stage_Begin("iceCreamIsland");
#endregion

#region Room Setup
script_execute(scr_MKSS_RoomSetup_IceCreamIsland);
#endregion

#region Intro Cutscene
if (!global.MKSS_StageList[global.MKSS_StageIDs[? "iceCreamIsland"]].beaten)
{
	instance_create_layer(0,0,"Instances",obj_MKSS_Cutscene_TutorialIntro);
	instance_create_layer(0,0,"Instances",obj_MKSS_CameraOffsetController);
}
#endregion