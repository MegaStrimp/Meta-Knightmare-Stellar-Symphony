///@description Create

#region Initialize Variables
#region Component Setup
scr_Component_ButtonInputTimer_Setup(5);
#endregion

#region Other Variables
playerNum = 0;

speedMultFinal = global.speedMultGlobal * global.deltaTime;

selection = 0;

hintOffset = 32;
hintOffset = 0;
hintOffsetTimerMax = 15;
hintOffsetTimer = hintOffsetTimerMax;

currentCategory = global.MKSS_UpgradeTypeIDs[? "base"];
constellationList = ds_list_create();
constellationTypeList = ds_list_create();
#endregion
#endregion

//MAKE THIS A SCRIPT

for (var i = 0; i < ds_map_size(global.MKSS_UpgradeTypeIDs); i++)
{
	if (global.MKSS_UpgradeTypeList[i].isUnlocked)
	{
		ds_list_add(constellationTypeList,i);
	}
}

//MAKE THIS A SCRIPT TOO
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