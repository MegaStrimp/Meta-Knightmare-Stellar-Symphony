///@description MKSS - Upgrade Type - Init - Set

function scr_MKSS_UpgradeType_Init_Set()
{
	#region Setup
	global.MKSS_UpgradeTypeList = [];
	global.MKSS_UpgradeTypeIDs = ds_map_create();
	#endregion
	
	#region Upgrade Types
	scr_MKSS_UpgradeType_Init_Add("base","Base");
	scr_MKSS_UpgradeType_Init_Add("galaxia","Galaxia");
	scr_MKSS_UpgradeType_Init_Add("buzzcut","Buzzcut");
	scr_MKSS_UpgradeType_Init_Add("whiplash","Whiplash");
	scr_MKSS_UpgradeType_Init_Add("trifecta","Trifecta");
	scr_MKSS_UpgradeType_Init_Add("stella","Stella");
	#endregion
}