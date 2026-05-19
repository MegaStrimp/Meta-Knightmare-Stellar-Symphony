///@description MKSS - Menu - Upgrades - Set Upgrade Types

function scr_MKSS_Menu_Upgrades_SetUpgradeTypes()
{
	ds_list_clear(constellationTypeList);
	
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeTypeIDs); i++)
	{
		if (global.MKSS_UpgradeTypeList[i].isUnlocked)
		{
			ds_list_add(constellationTypeList,i);
		}
	}
}