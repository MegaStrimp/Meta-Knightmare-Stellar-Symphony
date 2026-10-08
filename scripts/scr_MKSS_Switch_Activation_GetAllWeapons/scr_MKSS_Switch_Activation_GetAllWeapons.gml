///@description MKSS - Switch - Activation - Get All Weapons

function scr_MKSS_Switch_Activation_GetAllWeapons()
{
	#region Variables
	global.fullSaveLoaded = true;
	#endregion
	
	for (var i = 0; i < ds_map_size(global.MKSS_WeaponIDs); i++)
	{
		scr_MKSS_Player_UnlockWeapon(,i);
	}
	
	scr_MKSS_SaveData(global.selectedSave);
	
	scr_MKSS_Player_SetWeapons();
	scr_MKSS_Player_GetUnlockedUpgrades();
}