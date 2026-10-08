///@description MKSS - Switch - Activation - Get Finished Weapons

function scr_MKSS_Switch_Activation_GetFinishedWeapons()
{
	#region Variables
	global.fullSaveLoaded = true;
	#endregion
	
	for (var i = 0; i < 2; i++)
	{
		scr_MKSS_Player_UnlockWeapon(,i);
	}
	
	scr_MKSS_SaveData(global.selectedSave);
	
	scr_MKSS_Player_SetWeapons();
	scr_MKSS_Player_GetUnlockedUpgrades();
}