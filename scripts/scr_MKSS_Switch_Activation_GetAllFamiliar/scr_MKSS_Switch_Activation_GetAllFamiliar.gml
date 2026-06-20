///@description MKSS - Switch - Activation - Get All Familiars

function scr_MKSS_Switch_Activation_GetAllFamiliars()
{
	for (var i = 0; i < ds_map_size(global.MKSS_FamiliarIDs); i++)
	{
		global.MKSS_FamiliarList[i].isUnlocked = true;
	}
}