///@description Room Creation Code

#region Room Setup
script_execute(scr_MKSS_RoomSetup_IceCreamIsland);
#endregion

#region Cutscene
if ((!global.MKSS_StageList[global.MKSS_StageIDs[? "iceCreamIsland"]].isBeaten) and (room != global.roomPrevious))
{
	with (instance_create_layer(0,0,"Instances",obj_MKSS_Cutscene))
	{
		scr_MKSS_Cutscene_Preset_IceCreamIslandEnemyPortal();
	}
}
else
{
	with (instance_create_layer(176,168,"Enemies",obj_MKSS_Enemy_WaddleDee))
	{
		dirX = -1;
		image_xscale = dirX;
		scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup();
	}
}
#endregion