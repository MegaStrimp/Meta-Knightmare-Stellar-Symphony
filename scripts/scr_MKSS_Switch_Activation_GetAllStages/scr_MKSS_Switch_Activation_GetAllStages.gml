///@description MKSS - Switch - Activation - Get All Stages

function scr_MKSS_Switch_Activation_GetAllStages()
{
	#region Variables
	global.fullSaveLoaded = true;
	#endregion
	
	for (var i = 0; i < ds_map_size(global.MKSS_StageIDs); i++)
	{
		global.MKSS_StageList[i].isUnlocked = true;
	}
}