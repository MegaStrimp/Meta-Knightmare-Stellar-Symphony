///@description MKSS - Menu - Upgrades - Set Upgrades

function scr_MKSS_Menu_Upgrades_SetUpgrades(targetCategory)
{
	ds_list_clear(constellationList);
	
	constellationOffsets = 0;
	
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeIDs); i++)
	{
		if (global.MKSS_UpgradeList[i].categoryID == targetCategory)
		{
			ds_list_add(constellationList,i);
		}
	}
	
	for (var i = 0; i < ds_list_size(constellationList); i++)
	{
		constellationOffsets[i] =
		{
			x: 0,
			y: 0,
			wave: irandom_range(3600,5000)
		}
	}
	
	selection = ds_list_find_value(constellationList,0);
}