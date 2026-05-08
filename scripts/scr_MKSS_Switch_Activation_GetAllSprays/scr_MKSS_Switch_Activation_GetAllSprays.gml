///@description MKSS - Switch - Activation - Get All Sprays

function scr_MKSS_Switch_Activation_GetAllSprays()
{
	for (var i = 0; i < ds_map_size(global.MKSS_SprayPaintIDs); i++)
	{
		global.MKSS_SprayPaintList[i].isUnlocked = true;
	}
}