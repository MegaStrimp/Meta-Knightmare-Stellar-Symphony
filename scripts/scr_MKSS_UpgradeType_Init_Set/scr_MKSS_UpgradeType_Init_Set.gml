///@description MKSS - Upgrade Type - Init - Set

function scr_MKSS_UpgradeType_Init_Set()
{
	#region Setup
	global.MKSS_UpgradeTypeList = [];
	global.MKSS_UpgradeTypeIDs = ds_map_create();
	#endregion
	
	#region Upgrade Types
	var targetMappedID = scr_MKSS_UpgradeType_Init_Add("base","Base");
	global.MKSS_UpgradeTypeList[targetMappedID].isDefault = true;
	
	var targetMappedID = scr_MKSS_UpgradeType_Init_Add("galaxia","Galaxia");
	global.MKSS_UpgradeTypeList[targetMappedID].isDefault = true;
	
	var targetMappedID = scr_MKSS_UpgradeType_Init_Add("buzzcut","Buzzcut");
	
	var targetMappedID = scr_MKSS_UpgradeType_Init_Add("whiplash","Whiplash");
	
	var targetMappedID = scr_MKSS_UpgradeType_Init_Add("trifecta","Trifecta");
	
	var targetMappedID = scr_MKSS_UpgradeType_Init_Add("stella","Stella");
	#endregion
}