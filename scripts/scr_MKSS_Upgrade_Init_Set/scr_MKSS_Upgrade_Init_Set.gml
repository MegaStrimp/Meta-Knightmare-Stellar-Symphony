///@description MKSS - Upgrade - Init - Set

function scr_MKSS_Upgrade_Init_Set()
{
	#region Setup
	global.MKSS_UpgradeList = [];
	global.MKSS_UpgradeIDs = ds_map_create();
	#endregion
	
	#region Upgrades
	#region Base
	var categoryID = global.MKSS_UpgradeTypeIDs[? "base"];
	
	var targetMappedID_Test1 = scr_MKSS_Upgrade_Init_Add("test1",categoryID,62,83);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Test1);
	
	var targetMappedID_Test2 = scr_MKSS_Upgrade_Init_Add("test2",categoryID,109,73);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Test2);
	
	var targetMappedID_Test3 = scr_MKSS_Upgrade_Init_Add("test3",categoryID,120,25);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Test3);
	
	var targetMappedID_Test4 = scr_MKSS_Upgrade_Init_Add("test4",categoryID,130,73);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Test4);
	
	var targetMappedID_Test5 = scr_MKSS_Upgrade_Init_Add("test5",categoryID,177,83);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Test5);
	
	var targetMappedID_Test6 = scr_MKSS_Upgrade_Init_Add("test6",categoryID,130,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Test6);
	
	var targetMappedID_Test7 = scr_MKSS_Upgrade_Init_Add("test7",categoryID,120,141);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Test7);
	
	var targetMappedID_Test8 = scr_MKSS_Upgrade_Init_Add("test8",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Test8);
	
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Test1,,targetMappedID_Test2,targetMappedID_Test2,targetMappedID_Test8);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Test2,targetMappedID_Test1,targetMappedID_Test3,targetMappedID_Test3,targetMappedID_Test1);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Test3);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Test4);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Test5);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Test6);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Test7);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Test8);
	#endregion
	#endregion
}