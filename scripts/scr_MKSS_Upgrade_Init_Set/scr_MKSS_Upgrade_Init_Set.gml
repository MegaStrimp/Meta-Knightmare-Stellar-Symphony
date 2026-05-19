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
	
	#region Upgrade Nodes
	var targetMappedID_Base_Parry = scr_MKSS_Upgrade_Init_Add("Base_Parry",categoryID,61,66);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_Parry,"Parry");
	
	var targetMappedID_Base_Counter = scr_MKSS_Upgrade_Init_Add("Base_Counter",categoryID,83,81);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_Counter,"Counter");
	
	var targetMappedID_Base_Dodge = scr_MKSS_Upgrade_Init_Add("Base_Dodge",categoryID,178,66);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_Dodge,"Dodge");
	
	var targetMappedID_Base_ShadowDodge = scr_MKSS_Upgrade_Init_Add("Base_ShadowDodge",categoryID,156,81);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_ShadowDodge,"Shadow Dodge");
	
	var targetMappedID_Base_SharpSlide = scr_MKSS_Upgrade_Init_Add("Base_SharpSlide",categoryID,120,122);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_SharpSlide,"Sharp Slide");
	
	var targetMappedID_Base_SonicWings = scr_MKSS_Upgrade_Init_Add("Base_SonicWings",categoryID,119,16);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_SonicWings,"Sonic Wings");
	#endregion
	
	#region Lesser Nodes
	var targetMappedID_Base_Lesser1 = scr_MKSS_Upgrade_Init_Add("Base_Lesser1",categoryID,65,91,true);
	var targetMappedID_Base_Lesser2 = scr_MKSS_Upgrade_Init_Add("Base_Lesser2",categoryID,78,109,true);
	var targetMappedID_Base_Lesser3 = scr_MKSS_Upgrade_Init_Add("Base_Lesser3",categoryID,161,109,true);
	var targetMappedID_Base_Lesser4 = scr_MKSS_Upgrade_Init_Add("Base_Lesser4",categoryID,174,91,true);
	var targetMappedID_Base_Lesser5 = scr_MKSS_Upgrade_Init_Add("Base_Lesser5",categoryID,175,45,true);
	var targetMappedID_Base_Lesser6 = scr_MKSS_Upgrade_Init_Add("Base_Lesser6",categoryID,175,36,true);
	var targetMappedID_Base_Lesser7 = scr_MKSS_Upgrade_Init_Add("Base_Lesser7",categoryID,166,35,true);
	var targetMappedID_Base_Lesser8 = scr_MKSS_Upgrade_Init_Add("Base_Lesser8",categoryID,156,52,true);
	var targetMappedID_Base_Lesser9 = scr_MKSS_Upgrade_Init_Add("Base_Lesser9",categoryID,154,26,true);
	var targetMappedID_Base_Lesser10 = scr_MKSS_Upgrade_Init_Add("Base_Lesser10",categoryID,151,15,true);
	var targetMappedID_Base_Lesser11 = scr_MKSS_Upgrade_Init_Add("Base_Lesser11",categoryID,140,20,true);
	var targetMappedID_Base_Lesser12 = scr_MKSS_Upgrade_Init_Add("Base_Lesser12",categoryID,140,43,true);
	var targetMappedID_Base_Lesser13 = scr_MKSS_Upgrade_Init_Add("Base_Lesser13",categoryID,99,20,true);
	var targetMappedID_Base_Lesser14 = scr_MKSS_Upgrade_Init_Add("Base_Lesser14",categoryID,88,15,true);
	var targetMappedID_Base_Lesser15 = scr_MKSS_Upgrade_Init_Add("Base_Lesser15",categoryID,85,26,true);
	var targetMappedID_Base_Lesser16 = scr_MKSS_Upgrade_Init_Add("Base_Lesser16",categoryID,99,43,true);
	var targetMappedID_Base_Lesser17 = scr_MKSS_Upgrade_Init_Add("Base_Lesser17",categoryID,73,35,true);
	var targetMappedID_Base_Lesser18 = scr_MKSS_Upgrade_Init_Add("Base_Lesser18",categoryID,64,36,true);
	var targetMappedID_Base_Lesser19 = scr_MKSS_Upgrade_Init_Add("Base_Lesser19",categoryID,64,45,true);
	var targetMappedID_Base_Lesser20 = scr_MKSS_Upgrade_Init_Add("Base_Lesser20",categoryID,83,52,true);
	var targetMappedID_Base_Lesser21 = scr_MKSS_Upgrade_Init_Add("Base_Lesser21",categoryID,120,92,true);
	var targetMappedID_Base_Lesser22 = scr_MKSS_Upgrade_Init_Add("Base_Lesser22",categoryID,168,61,true);
	var targetMappedID_Base_Lesser23 = scr_MKSS_Upgrade_Init_Add("Base_Lesser23",categoryID,120,76,true);
	var targetMappedID_Base_Lesser24 = scr_MKSS_Upgrade_Init_Add("Base_Lesser24",categoryID,71,61,true);
	#endregion
	
	#region Neighbor Setup
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Parry,,targetMappedID_Base_Counter,targetMappedID_Base_Lesser19,targetMappedID_Base_Lesser1);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser1,,,targetMappedID_Base_Parry,targetMappedID_Base_Lesser2);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser2,,targetMappedID_Base_SharpSlide,targetMappedID_Base_Lesser1);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_SharpSlide,targetMappedID_Base_Lesser2,targetMappedID_Base_Lesser3);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser3,targetMappedID_Base_SharpSlide,,targetMappedID_Base_Lesser4);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser4,,,targetMappedID_Base_Dodge,targetMappedID_Base_Lesser3);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Dodge,targetMappedID_Base_ShadowDodge,,targetMappedID_Base_Lesser5,targetMappedID_Base_Lesser4);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser5,targetMappedID_Base_Lesser8,,targetMappedID_Base_Lesser6,targetMappedID_Base_Dodge);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser6,targetMappedID_Base_Lesser7,,,targetMappedID_Base_Lesser5);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser7,targetMappedID_Base_Lesser9,targetMappedID_Base_Lesser6,,targetMappedID_Base_Lesser8);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser8,,targetMappedID_Base_Lesser5,targetMappedID_Base_Lesser7);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser9,targetMappedID_Base_Lesser12,targetMappedID_Base_Lesser7,targetMappedID_Base_Lesser10);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser10,targetMappedID_Base_Lesser11,targetMappedID_Base_Lesser9);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser11,targetMappedID_Base_SonicWings,targetMappedID_Base_Lesser10,,targetMappedID_Base_Lesser12);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser12,,targetMappedID_Base_Lesser9,targetMappedID_Base_Lesser11);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_SonicWings,targetMappedID_Base_Lesser13,targetMappedID_Base_Lesser11);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser13,targetMappedID_Base_Lesser14,targetMappedID_Base_SonicWings,,targetMappedID_Base_Lesser16);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser14,targetMappedID_Base_Lesser15,targetMappedID_Base_Lesser13);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser15,targetMappedID_Base_Lesser17,targetMappedID_Base_Lesser14,,targetMappedID_Base_Lesser16);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser16,targetMappedID_Base_Lesser15,,targetMappedID_Base_Lesser13);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser17,targetMappedID_Base_Lesser18,targetMappedID_Base_Lesser15,,targetMappedID_Base_Lesser20);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser18,,targetMappedID_Base_Lesser17,,targetMappedID_Base_Lesser19);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser19,,targetMappedID_Base_Lesser20,targetMappedID_Base_Lesser18,targetMappedID_Base_Parry);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser20,targetMappedID_Base_Lesser19,,targetMappedID_Base_Lesser17);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Counter,targetMappedID_Base_Parry,targetMappedID_Base_Lesser21,targetMappedID_Base_Lesser24);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser21,targetMappedID_Base_Counter,targetMappedID_Base_ShadowDodge);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_ShadowDodge,targetMappedID_Base_Lesser21,targetMappedID_Base_Dodge,targetMappedID_Base_Lesser22);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser22,targetMappedID_Base_Lesser23,,,targetMappedID_Base_ShadowDodge);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser23,targetMappedID_Base_Lesser24,targetMappedID_Base_Lesser22);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Base_Lesser24,,targetMappedID_Base_Lesser23,,targetMappedID_Base_Counter);
	#endregion
	#endregion
	
	#region Galaxia
	var categoryID = global.MKSS_UpgradeTypeIDs[? "galaxia"];
	
	var targetMappedID_Galaxia_Kick = scr_MKSS_Upgrade_Init_Add("Galaxia_Kick",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Kick,"Kick");
	
	var targetMappedID_Galaxia_Barrage = scr_MKSS_Upgrade_Init_Add("Galaxia_Barrage",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Barrage,"Barrage");
	
	var targetMappedID_Galaxia_Finisher = scr_MKSS_Upgrade_Init_Add("Galaxia_Finisher",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Finisher,"Finisher");
	
	var targetMappedID_Galaxia_ExtraFinisher = scr_MKSS_Upgrade_Init_Add("Galaxia_ExtraFinisher",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_ExtraFinisher,"Extra Finisher");
	
	var targetMappedID_Galaxia_MachTornado = scr_MKSS_Upgrade_Init_Add("Galaxia_MachTornado",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_MachTornado,"Mach Tornado");
	
	var targetMappedID_Galaxia_MachPrime = scr_MKSS_Upgrade_Init_Add("Galaxia_MachPrime",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_MachPrime,"Mach Prime");
	
	var targetMappedID_Galaxia_Stab = scr_MKSS_Upgrade_Init_Add("Galaxia_Stab",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Stab,"Stab");
	
	var targetMappedID_Galaxia_CircleSlash = scr_MKSS_Upgrade_Init_Add("Galaxia_CircleSlash",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_CircleSlash,"Circle Slash");
	
	var targetMappedID_Galaxia_GroundPound = scr_MKSS_Upgrade_Init_Add("Galaxia_GroundPound",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_GroundPound,"Ground Pound");
	
	var targetMappedID_Galaxia_BlastPound = scr_MKSS_Upgrade_Init_Add("Galaxia_BlastPound",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_BlastPound,"Blast Pound");
	
	var targetMappedID_Galaxia_UpJuggle = scr_MKSS_Upgrade_Init_Add("Galaxia_UpJuggle",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_UpJuggle,"Up Juggle");
	#endregion
	
	#region Buzzcut
	var categoryID = global.MKSS_UpgradeTypeIDs[? "buzzcut"];
	
	var targetMappedID_Buzzcut_Finisher = scr_MKSS_Upgrade_Init_Add("Buzzcut_Finisher",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Buzzcut_Finisher);
	#endregion
	
	#region Whiplash
	var categoryID = global.MKSS_UpgradeTypeIDs[? "whiplash"];
	
	var targetMappedID_Whiplash_Finisher = scr_MKSS_Upgrade_Init_Add("Whiplash_Finisher",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Whiplash_Finisher);
	#endregion
	
	#region Trifecta
	var categoryID = global.MKSS_UpgradeTypeIDs[? "trifecta"];
	
	var targetMappedID_Trifecta_Finisher = scr_MKSS_Upgrade_Init_Add("Trifecta_Finisher",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Trifecta_Finisher);
	#endregion
	
	#region Stella
	var categoryID = global.MKSS_UpgradeTypeIDs[? "stella"];
	
	var targetMappedID_Stella_Finisher = scr_MKSS_Upgrade_Init_Add("Stella_Finisher",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Stella_Finisher);
	#endregion
	#endregion
}