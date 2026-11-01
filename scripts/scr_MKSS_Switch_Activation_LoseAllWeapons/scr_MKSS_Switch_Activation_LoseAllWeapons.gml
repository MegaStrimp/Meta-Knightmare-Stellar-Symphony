///@description MKSS - Switch - Activation - Lose All Weapons

function scr_MKSS_Switch_Activation_LoseAllWeapons()
{
	#region Variables
	global.fullSaveLoaded = true;
	#endregion
	
	for (var i = 0; i < ds_map_size(global.MKSS_WeaponIDs); i++)
	{
		global.MKSS_WeaponList[i].isUnlocked = false;
	}
	
	scr_MKSS_SaveData(global.selectedSave);
	
	scr_MKSS_Player_SetWeapons();
	scr_MKSS_Player_GetUnlockedUpgrades();
}