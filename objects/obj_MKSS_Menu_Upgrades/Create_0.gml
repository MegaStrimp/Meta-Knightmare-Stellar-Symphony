///@description Create

#region Initialize Variables
playerNum = 0;

currentCategory = global.MKSS_UpgradeTypeIDs[? "base"];
constellationList = ds_list_create();
#endregion

// MAKE THIS A SCRIPT
constellationOffsets = 0;

for (var i = 0; i < ds_map_size(global.MKSS_UpgradeIDs); i++)
{
	if (global.MKSS_UpgradeList[i].categoryID == currentCategory)
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