///@description Create

#region Initialize Variables
#region Component Setup
scr_Component_ButtonInputTimer_Setup(5);
#endregion

#region Other Variables
playerNum = 0;

speedMultFinal = global.speedMultGlobal * global.deltaTime;

displayedMetaPoints = 0;
currentCategory = 0;
canSelect = false;
selection = 0;

hintOffset = 32;
hintOffset = 0;
hintOffsetTimerMax = 15;
hintOffsetTimer = hintOffsetTimerMax;
notifBoxOffset = 0;
colorOffset = 0;

selectionIndex = 0;
selectionSpd = sprite_get_speed(spr_MKSS_UI_Shared_Selection) / 60;
selectionNumber = sprite_get_number(spr_MKSS_UI_Shared_Selection);

metaPointsPurchaseTimer = -1;
metaPointsPurchaseTimerMax = 4;

constellationTypeList = ds_list_create();
constellationTypeList_CurrentIndex = 0;
constellationList = ds_list_create();
#endregion
#endregion

#region Set Categories & Upgrades
scr_MKSS_Menu_Upgrades_SetUpgradeTypes();
currentCategory = ds_list_find_value(constellationTypeList,0);

scr_MKSS_Menu_Upgrades_SetUpgrades(currentCategory);
#endregion