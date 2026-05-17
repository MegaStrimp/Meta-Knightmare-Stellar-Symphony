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
	
	#region Test STRIMPTODO
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
	
	var targetMappedID_Base_Parry = scr_MKSS_Upgrade_Init_Add("Base_Parry",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_Parry);
	
	var targetMappedID_Base_Counter = scr_MKSS_Upgrade_Init_Add("Base_Counter",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_Counter);
	
	var targetMappedID_Base_Dodge = scr_MKSS_Upgrade_Init_Add("Base_Dodge",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_Dodge);
	
	var targetMappedID_Base_ShadowDodge = scr_MKSS_Upgrade_Init_Add("Base_ShadowDodge",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_ShadowDodge);
	
	var targetMappedID_Base_SharpSlide = scr_MKSS_Upgrade_Init_Add("Base_SharpSlide",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_SharpSlide);
	
	var targetMappedID_Base_SonicWings = scr_MKSS_Upgrade_Init_Add("Base_SonicWings",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_SonicWings);
	#endregion
	
	#region Galaxia
	var categoryID = global.MKSS_UpgradeTypeIDs[? "galaxia"];
	
	var targetMappedID_Galaxia_Kick = scr_MKSS_Upgrade_Init_Add("Galaxia_Kick",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Kick);
	
	var targetMappedID_Galaxia_Barrage = scr_MKSS_Upgrade_Init_Add("Galaxia_Barrage",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Barrage);
	
	var targetMappedID_Galaxia_Finisher = scr_MKSS_Upgrade_Init_Add("Galaxia_Finisher",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Finisher);
	
	var targetMappedID_Galaxia_ExtraFinisher = scr_MKSS_Upgrade_Init_Add("Galaxia_ExtraFinisher",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_ExtraFinisher);
	
	var targetMappedID_Galaxia_MachTornado = scr_MKSS_Upgrade_Init_Add("Galaxia_MachTornado",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_MachTornado);
	
	var targetMappedID_Galaxia_MachPrime = scr_MKSS_Upgrade_Init_Add("Galaxia_MachPrime",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_MachPrime);
	
	var targetMappedID_Galaxia_Stab = scr_MKSS_Upgrade_Init_Add("Galaxia_Stab",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Stab);
	
	var targetMappedID_Galaxia_CircleSlash = scr_MKSS_Upgrade_Init_Add("Galaxia_CircleSlash",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_CircleSlash);
	
	var targetMappedID_Galaxia_GroundPound = scr_MKSS_Upgrade_Init_Add("Galaxia_GroundPound",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_GroundPound);
	
	var targetMappedID_Galaxia_BlastPound = scr_MKSS_Upgrade_Init_Add("Galaxia_BlastPound",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_BlastPound);
	
	var targetMappedID_Galaxia_UpJuggle = scr_MKSS_Upgrade_Init_Add("Galaxia_UpJuggle",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_UpJuggle);
	#endregion
	
	#region Buzzcut
	var categoryID = global.MKSS_UpgradeTypeIDs[? "buzzcut"];
	
	var targetMappedID_Buzzcut_Temp = scr_MKSS_Upgrade_Init_Add("Buzzcut_Temp",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Buzzcut_Temp);
	#endregion
	
	#region Whiplash
	var categoryID = global.MKSS_UpgradeTypeIDs[? "whiplash"];
	
	var targetMappedID_Whiplash_Temp = scr_MKSS_Upgrade_Init_Add("Whiplash_Temp",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Whiplash_Temp);
	#endregion
	
	#region Trifecta
	var categoryID = global.MKSS_UpgradeTypeIDs[? "trifecta"];
	
	var targetMappedID_Trifecta_Temp = scr_MKSS_Upgrade_Init_Add("Trifecta_Temp",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Trifecta_Temp);
	#endregion
	
	#region Stella
	var categoryID = global.MKSS_UpgradeTypeIDs[? "stella"];
	
	var targetMappedID_Stella_Temp = scr_MKSS_Upgrade_Init_Add("Stella_Temp",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Stella_Temp);
	#endregion
	#endregion
}