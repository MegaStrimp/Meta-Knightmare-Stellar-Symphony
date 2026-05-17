///@description MKSS - Player - Get Unlocked Upgrades

function scr_MKSS_Player_GetUnlockedUpgrades(playerNum)
{
	ds_list_clear(global.MKSS_PlayerUpgradeList[playerNum]);
	
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeIDs); i++)
	{
		if (global.MKSS_UpgradeList[i].isUnlocked)
		{
			ds_list_add(global.MKSS_PlayerUpgradeList[playerNum],i);
		}
	}
}