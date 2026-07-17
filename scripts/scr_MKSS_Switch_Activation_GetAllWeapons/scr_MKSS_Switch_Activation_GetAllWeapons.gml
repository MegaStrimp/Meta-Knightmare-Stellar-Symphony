///@description MKSS - Switch - Activation - Get All Weapons

function scr_MKSS_Switch_Activation_GetAllWeapons()
{
	#region Variables
	global.fullSaveLoaded = true;
	#endregion
	
	for (var i = 0; i < ds_map_size(global.MKSS_WeaponIDs); i++)
	{
		global.MKSS_WeaponList[i].isUnlocked = true;
	}
	
	with (obj_Player) if (playerNum == 0) scr_MKSS_Player_SetWeapons();
}