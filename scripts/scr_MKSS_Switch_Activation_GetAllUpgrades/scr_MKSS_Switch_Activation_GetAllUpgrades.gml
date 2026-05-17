///@description MKSS - Switch - Activation - Get All Upgrades

function scr_MKSS_Switch_Activation_GetAllUpgrades()
{
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeIDs); i++)
	{
		global.MKSS_UpgradeList[i].isUnlocked = true;
	}
	
	scr_MKSS_Player_GetUnlockedUpgrades(0);
}