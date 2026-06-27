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
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_Parry,"Parry",["Parry various objects and enemies in [#F8F8F8]green[/color] coloring!\n\n[LTIcon]/[RTIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Base_Parry]);
	
	var targetMappedID_Base_Counter = scr_MKSS_Upgrade_Init_Add("Base_Counter",categoryID,83,81,targetMappedID_Base_Parry);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_Counter,"Counter",["Execute the Finisher Attack of your equipped sword after a parry!\n\nSuccessful Parry - [BIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Base_Counter]);
	
	var targetMappedID_Base_Dodge = scr_MKSS_Upgrade_Init_Add("Base_Dodge",categoryID,178,66);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_Dodge,"Dodge",["Dodge from dangerous attacks, don't touch them!\n\n[LTIcon]/[RTIcon] - [LTIcon]/[RTIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Base_Dodge]);
	
	var targetMappedID_Base_ShadowDodge = scr_MKSS_Upgrade_Init_Add("Base_ShadowDodge",categoryID,156,81,targetMappedID_Base_Dodge);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_ShadowDodge,"Shadow Dodge",["Dodge in shadow speed without taking hit from most attacks!\n\n[LTIcon]/[RTIcon] - [LTIcon]/[RTIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Base_ShadowDodge]);
	
	var targetMappedID_Base_SharpSlide = scr_MKSS_Upgrade_Init_Add("Base_SharpSlide",categoryID,120,122);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_SharpSlide,"Sharp Slide",["Pierce through your enemies while sliding with your sharp boots!\n\n[DownIcon] - [AIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Base_SharpSlide]);
	
	var targetMappedID_Base_SonicWings = scr_MKSS_Upgrade_Init_Add("Base_SonicWings",categoryID,119,16);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Base_SonicWings,"Sonic Wings",["Flap your bat wings faster and faster, allowing you to move faster and fly faster!\n\nMidair - [AIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Base_SonicWings]);
	#endregion
	
	#region Lesser Nodes
	var targetMappedID_Base_Lesser1 = scr_MKSS_Upgrade_Init_Add("Base_Lesser1",categoryID,65,91,,true);
	var targetMappedID_Base_Lesser2 = scr_MKSS_Upgrade_Init_Add("Base_Lesser2",categoryID,78,109,,true);
	var targetMappedID_Base_Lesser3 = scr_MKSS_Upgrade_Init_Add("Base_Lesser3",categoryID,161,109,,true);
	var targetMappedID_Base_Lesser4 = scr_MKSS_Upgrade_Init_Add("Base_Lesser4",categoryID,174,91,,true);
	var targetMappedID_Base_Lesser5 = scr_MKSS_Upgrade_Init_Add("Base_Lesser5",categoryID,175,45,,true);
	var targetMappedID_Base_Lesser6 = scr_MKSS_Upgrade_Init_Add("Base_Lesser6",categoryID,175,36,,true);
	var targetMappedID_Base_Lesser7 = scr_MKSS_Upgrade_Init_Add("Base_Lesser7",categoryID,166,35,,true);
	var targetMappedID_Base_Lesser8 = scr_MKSS_Upgrade_Init_Add("Base_Lesser8",categoryID,156,52,,true);
	var targetMappedID_Base_Lesser9 = scr_MKSS_Upgrade_Init_Add("Base_Lesser9",categoryID,154,26,,true);
	var targetMappedID_Base_Lesser10 = scr_MKSS_Upgrade_Init_Add("Base_Lesser10",categoryID,151,15,,true);
	var targetMappedID_Base_Lesser11 = scr_MKSS_Upgrade_Init_Add("Base_Lesser11",categoryID,140,20,,true);
	var targetMappedID_Base_Lesser12 = scr_MKSS_Upgrade_Init_Add("Base_Lesser12",categoryID,140,43,,true);
	var targetMappedID_Base_Lesser13 = scr_MKSS_Upgrade_Init_Add("Base_Lesser13",categoryID,99,20,,true);
	var targetMappedID_Base_Lesser14 = scr_MKSS_Upgrade_Init_Add("Base_Lesser14",categoryID,88,15,,true);
	var targetMappedID_Base_Lesser15 = scr_MKSS_Upgrade_Init_Add("Base_Lesser15",categoryID,85,26,,true);
	var targetMappedID_Base_Lesser16 = scr_MKSS_Upgrade_Init_Add("Base_Lesser16",categoryID,99,43,,true);
	var targetMappedID_Base_Lesser17 = scr_MKSS_Upgrade_Init_Add("Base_Lesser17",categoryID,73,35,,true);
	var targetMappedID_Base_Lesser18 = scr_MKSS_Upgrade_Init_Add("Base_Lesser18",categoryID,64,36,,true);
	var targetMappedID_Base_Lesser19 = scr_MKSS_Upgrade_Init_Add("Base_Lesser19",categoryID,64,45,,true);
	var targetMappedID_Base_Lesser20 = scr_MKSS_Upgrade_Init_Add("Base_Lesser20",categoryID,83,52,,true);
	var targetMappedID_Base_Lesser21 = scr_MKSS_Upgrade_Init_Add("Base_Lesser21",categoryID,120,92,,true);
	var targetMappedID_Base_Lesser22 = scr_MKSS_Upgrade_Init_Add("Base_Lesser22",categoryID,168,61,,true);
	var targetMappedID_Base_Lesser23 = scr_MKSS_Upgrade_Init_Add("Base_Lesser23",categoryID,120,76,,true);
	var targetMappedID_Base_Lesser24 = scr_MKSS_Upgrade_Init_Add("Base_Lesser24",categoryID,71,61,,true);
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
	
	#region Upgrade Nodes
	var targetMappedID_Galaxia_Kick = scr_MKSS_Upgrade_Init_Add("Galaxia_Kick",categoryID,98,91);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Kick,"Kick",["Continue your basic combo with a kick that knocks the enemy back!\n\n[BIcon] - [BIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Galaxia_Kick]);
	
	var targetMappedID_Galaxia_Barrage = scr_MKSS_Upgrade_Init_Add("Galaxia_Barrage",categoryID,103,78,targetMappedID_Galaxia_Kick);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Barrage,"Barrage",["End your basic combo with a sword barrage!\n\n[BIcon] - [BIcon] - [BIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Galaxia_Barrage]);
	
	var targetMappedID_Galaxia_Finisher = scr_MKSS_Upgrade_Init_Add("Galaxia_Finisher",categoryID,91,80,targetMappedID_Galaxia_Barrage);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Finisher,"Finisher",["Cancel or conclude your combo with a heavy finisher slash! Deals more damage to enemies with low hp left!\n\nBasic Combo - [XIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Galaxia_Finisher]);
	
	var targetMappedID_Galaxia_ExtraFinisher = scr_MKSS_Upgrade_Init_Add("Galaxia_ExtraFinisher",categoryID,99,66,targetMappedID_Galaxia_Finisher);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_ExtraFinisher,"Extra Finisher",["Deal even more damage with your finisher slash!\n\nBasic Combo - [XIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Galaxia_ExtraFinisher]);
	
	var targetMappedID_Galaxia_MachTornado = scr_MKSS_Upgrade_Init_Add("Galaxia_MachTornado",categoryID,126,104);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_MachTornado,"Mach Tornado",["Spiral into a fast accelerating Mach Tornado and swallow your enemies! No copy abilities guaranteed!\n\n[XIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Galaxia_MachTornado]);
	
	var targetMappedID_Galaxia_MachPrime = scr_MKSS_Upgrade_Init_Add("Galaxia_MachPrime",categoryID,145,88,targetMappedID_Galaxia_MachTornado);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_MachPrime,"Mach Prime",["Make your Mach Tornado even larger and faster!\n\n[XIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Galaxia_MachPrime]);
	
	var targetMappedID_Galaxia_Stab = scr_MKSS_Upgrade_Init_Add("Galaxia_Stab",categoryID,77,116);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_Stab,"Stab",["Dash and stab through enemies with your sword!\n\nDash - [BIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Galaxia_Stab]);
	
	var targetMappedID_Galaxia_CircleSlash = scr_MKSS_Upgrade_Init_Add("Galaxia_CircleSlash",categoryID,137,129);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_CircleSlash,"Circle Slash",["Spin midair and slice enemies with your ring of doom!\n\nMidair - [AIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Galaxia_CircleSlash]);
	
	var targetMappedID_Galaxia_GroundPound = scr_MKSS_Upgrade_Init_Add("Galaxia_GroundPound",categoryID,113,52);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_GroundPound,"Ground Pound",["Pound the ground below you... along with everyone in your range!\n\nMidair - [DownIcon] - [AIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Galaxia_GroundPound]);
	
	var targetMappedID_Galaxia_BlastPound = scr_MKSS_Upgrade_Init_Add("Galaxia_BlastPound",categoryID,108,36,targetMappedID_Galaxia_GroundPound);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_BlastPound,"Blast Pound",["Pound the ground even harder and blast everyone around you!\n\nMidair - [DownIcon] - [AIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Galaxia_BlastPound]);
	
	var targetMappedID_Galaxia_UpJuggle = scr_MKSS_Upgrade_Init_Add("Galaxia_UpJuggle",categoryID,155,12);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Galaxia_UpJuggle,"Up Juggle",["Juggle your enemies like a jester with an up-thrust!\n\n[UpIcon] - [BIcon]"],[spr_MKSS_Menu_Upgrades_Notif_Galaxia_UpJuggle]);
	#endregion
	
	#region Lesser Nodes
	var targetMappedID_Galaxia_Lesser1 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser1",categoryID,98,75,,true);
	var targetMappedID_Galaxia_Lesser2 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser2",categoryID,108,65,,true);
	var targetMappedID_Galaxia_Lesser3 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser3",categoryID,101,57,,true);
	var targetMappedID_Galaxia_Lesser4 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser4",categoryID,108,49,,true);
	var targetMappedID_Galaxia_Lesser5 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser5",categoryID,122,28,,true);
	var targetMappedID_Galaxia_Lesser6 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser6",categoryID,134,52,,true);
	var targetMappedID_Galaxia_Lesser7 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser7",categoryID,161,47,,true);
	var targetMappedID_Galaxia_Lesser8 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser8",categoryID,147,70,,true);
	var targetMappedID_Galaxia_Lesser9 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser9",categoryID,153,72,,true);
	var targetMappedID_Galaxia_Lesser10 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser10",categoryID,162,65,,true);
	var targetMappedID_Galaxia_Lesser11 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser11",categoryID,151,82,,true);
	var targetMappedID_Galaxia_Lesser12 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser12",categoryID,140,82,,true);
	var targetMappedID_Galaxia_Lesser13 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser13",categoryID,133,93,,true);
	var targetMappedID_Galaxia_Lesser14 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser14",categoryID,138,94,,true);
	var targetMappedID_Galaxia_Lesser15 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser15",categoryID,139,103,,true);
	var targetMappedID_Galaxia_Lesser16 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser16",categoryID,117,118,,true);
	var targetMappedID_Galaxia_Lesser17 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser17",categoryID,128,117,,true);
	var targetMappedID_Galaxia_Lesser18 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser18",categoryID,127,127,,true);
	var targetMappedID_Galaxia_Lesser19 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser19",categoryID,118,136,,true);
	var targetMappedID_Galaxia_Lesser20 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser20",categoryID,101,134,,true);
	var targetMappedID_Galaxia_Lesser21 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser21",categoryID,95,144,,true);
	var targetMappedID_Galaxia_Lesser22 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser22",categoryID,85,139,,true);
	var targetMappedID_Galaxia_Lesser23 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser23",categoryID,89,128,,true);
	var targetMappedID_Galaxia_Lesser24 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser24",categoryID,79,104,,true);
	var targetMappedID_Galaxia_Lesser25 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser25",categoryID,73,96,,true);
	var targetMappedID_Galaxia_Lesser26 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser26",categoryID,87,96,,true);
	var targetMappedID_Galaxia_Lesser27 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser27",categoryID,92,107,,true);
	var targetMappedID_Galaxia_Lesser28 = scr_MKSS_Upgrade_Init_Add("Galaxia_Lesser28",categoryID,107,107,,true);
	#endregion
	
	#region Neighbor Setup
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Kick,targetMappedID_Galaxia_Finisher,,targetMappedID_Galaxia_Barrage,targetMappedID_Galaxia_Lesser27);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Barrage,targetMappedID_Galaxia_Lesser1,,targetMappedID_Galaxia_Lesser2,targetMappedID_Galaxia_Kick);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_ExtraFinisher,,targetMappedID_Galaxia_Lesser1,,targetMappedID_Galaxia_Finisher);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Finisher,,targetMappedID_Galaxia_Kick,targetMappedID_Galaxia_ExtraFinisher);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser1,targetMappedID_Galaxia_ExtraFinisher,targetMappedID_Galaxia_Barrage);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser2,targetMappedID_Galaxia_Lesser3,,targetMappedID_Galaxia_GroundPound,targetMappedID_Galaxia_Barrage);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser3,,targetMappedID_Galaxia_Lesser2,targetMappedID_Galaxia_BlastPound);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_BlastPound,,targetMappedID_Galaxia_Lesser4,,targetMappedID_Galaxia_Lesser3);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser4,targetMappedID_Galaxia_BlastPound,targetMappedID_Galaxia_GroundPound);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_GroundPound,targetMappedID_Galaxia_Lesser4,,targetMappedID_Galaxia_Lesser5,targetMappedID_Galaxia_Lesser2);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser5,,targetMappedID_Galaxia_Lesser6,targetMappedID_Galaxia_UpJuggle,targetMappedID_Galaxia_GroundPound);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser6,targetMappedID_Galaxia_Lesser5,,targetMappedID_Galaxia_Lesser7);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_UpJuggle,,targetMappedID_Galaxia_Lesser7,,targetMappedID_Galaxia_Lesser5);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser7,targetMappedID_Galaxia_UpJuggle,targetMappedID_Galaxia_Lesser8,,targetMappedID_Galaxia_Lesser6);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser8,targetMappedID_Galaxia_Lesser7,targetMappedID_Galaxia_Lesser9,,targetMappedID_Galaxia_Lesser12);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser9,targetMappedID_Galaxia_Lesser8,targetMappedID_Galaxia_Lesser10);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser10,targetMappedID_Galaxia_Lesser9,,,targetMappedID_Galaxia_Lesser11);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser11,targetMappedID_Galaxia_Lesser12,,targetMappedID_Galaxia_Lesser10);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser12,,targetMappedID_Galaxia_Lesser11,targetMappedID_Galaxia_Lesser8,targetMappedID_Galaxia_Lesser13);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser13,,targetMappedID_Galaxia_Lesser14,targetMappedID_Galaxia_Lesser12,targetMappedID_Galaxia_MachTornado);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser14,targetMappedID_Galaxia_Lesser13,targetMappedID_Galaxia_MachPrime);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_MachPrime,targetMappedID_Galaxia_Lesser14,,,targetMappedID_Galaxia_Lesser15);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser15,targetMappedID_Galaxia_MachTornado,,targetMappedID_Galaxia_MachPrime);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_MachTornado,,,targetMappedID_Galaxia_Lesser13,targetMappedID_Galaxia_Lesser16);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser16,targetMappedID_Galaxia_Lesser28,targetMappedID_Galaxia_Lesser17,targetMappedID_Galaxia_MachTornado);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser17,targetMappedID_Galaxia_Lesser16,targetMappedID_Galaxia_CircleSlash);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_CircleSlash,targetMappedID_Galaxia_Lesser17,,,targetMappedID_Galaxia_Lesser18);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser18,,,targetMappedID_Galaxia_CircleSlash,targetMappedID_Galaxia_Lesser19);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser19,targetMappedID_Galaxia_Lesser20,,targetMappedID_Galaxia_Lesser18);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser20,,targetMappedID_Galaxia_Lesser19,,targetMappedID_Galaxia_Lesser21);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser21,targetMappedID_Galaxia_Lesser22,,targetMappedID_Galaxia_Lesser20);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser22,,targetMappedID_Galaxia_Lesser21,targetMappedID_Galaxia_Lesser23);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser23,targetMappedID_Galaxia_Stab,,,targetMappedID_Galaxia_Lesser22);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Stab,,targetMappedID_Galaxia_Lesser23,targetMappedID_Galaxia_Lesser24);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser24,targetMappedID_Galaxia_Lesser25,,,targetMappedID_Galaxia_Stab);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser25,,targetMappedID_Galaxia_Lesser24,targetMappedID_Galaxia_Lesser26);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser26,,targetMappedID_Galaxia_Lesser27,,targetMappedID_Galaxia_Lesser25);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser27,targetMappedID_Galaxia_Lesser26,targetMappedID_Galaxia_Lesser28,targetMappedID_Galaxia_Kick);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Galaxia_Lesser28,targetMappedID_Galaxia_Lesser27,targetMappedID_Galaxia_Lesser16);
	#endregion
	#endregion
	
	#region Buzzcut
	var categoryID = global.MKSS_UpgradeTypeIDs[? "buzzcut"];
	
	#region Upgrade Nodes
	var targetMappedID_Buzzcut_ReverseSlash = scr_MKSS_Upgrade_Init_Add("Buzzcut_ReverseSlash",categoryID,77,83);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Buzzcut_ReverseSlash,"Reverse Slash");
	
	var targetMappedID_Buzzcut_Overcharge = scr_MKSS_Upgrade_Init_Add("Buzzcut_Overcharge",categoryID,77,61,targetMappedID_Buzzcut_ReverseSlash);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Buzzcut_Overcharge,"Overcharge");
	
	var targetMappedID_Buzzcut_Finisher = scr_MKSS_Upgrade_Init_Add("Buzzcut_Finisher",categoryID,67,73);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Buzzcut_Finisher,"Finisher");
	
	var targetMappedID_Buzzcut_Gigatorque = scr_MKSS_Upgrade_Init_Add("Buzzcut_Gigatorque",categoryID,67,48);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Buzzcut_Gigatorque,"Gigatorque");
	
	var targetMappedID_Buzzcut_Drillsaw = scr_MKSS_Upgrade_Init_Add("Buzzcut_Drillsaw",categoryID,82,36);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Buzzcut_Drillsaw,"Drillsaw");
	
	var targetMappedID_Buzzcut_Chainlings = scr_MKSS_Upgrade_Init_Add("Buzzcut_Chainlings",categoryID,101,18);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Buzzcut_Chainlings,"Chainlings");
	
	var targetMappedID_Buzzcut_SawBombard = scr_MKSS_Upgrade_Init_Add("Buzzcut_SawBombard",categoryID,120,20);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Buzzcut_SawBombard,"Saw Bombard");
	
	var targetMappedID_Buzzcut_ChainChakram = scr_MKSS_Upgrade_Init_Add("Buzzcut_ChainChakram",categoryID,160,51);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Buzzcut_ChainChakram,"Chain Chakram");
	#endregion
	
	#region Lesser Nodes
	var targetMappedID_Buzzcut_Lesser1 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser1",categoryID,77,55,,true);
	var targetMappedID_Buzzcut_Lesser2 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser2",categoryID,82,49,,true);
	var targetMappedID_Buzzcut_Lesser3 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser3",categoryID,98,33,,true);
	var targetMappedID_Buzzcut_Lesser4 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser4",categoryID,102,30,,true);
	var targetMappedID_Buzzcut_Lesser5 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser5",categoryID,110,30,,true);
	var targetMappedID_Buzzcut_Lesser6 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser6",categoryID,145,20,,true);
	var targetMappedID_Buzzcut_Lesser7 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser7",categoryID,132,30,,true);
	var targetMappedID_Buzzcut_Lesser8 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser8",categoryID,138,30,,true);
	var targetMappedID_Buzzcut_Lesser9 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser9",categoryID,144,35,,true);
	var targetMappedID_Buzzcut_Lesser10 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser10",categoryID,157,35,,true);
	var targetMappedID_Buzzcut_Lesser11 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser11",categoryID,175,54,,true);
	var targetMappedID_Buzzcut_Lesser12 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser12",categoryID,163,55,,true);
	var targetMappedID_Buzzcut_Lesser13 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser13",categoryID,163,63,,true);
	var targetMappedID_Buzzcut_Lesser14 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser14",categoryID,173,73,,true);
	var targetMappedID_Buzzcut_Lesser15 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser15",categoryID,173,98,,true);
	var targetMappedID_Buzzcut_Lesser16 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser16",categoryID,163,85,,true);
	var targetMappedID_Buzzcut_Lesser17 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser17",categoryID,163,91,,true);
	var targetMappedID_Buzzcut_Lesser18 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser18",categoryID,158,97,,true);
	var targetMappedID_Buzzcut_Lesser19 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser19",categoryID,158,110,,true);
	var targetMappedID_Buzzcut_Lesser20 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser20",categoryID,139,128,,true);
	var targetMappedID_Buzzcut_Lesser21 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser21",categoryID,142,113,,true);
	var targetMappedID_Buzzcut_Lesser22 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser22",categoryID,138,116,,true);
	var targetMappedID_Buzzcut_Lesser23 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser23",categoryID,130,116,,true);
	var targetMappedID_Buzzcut_Lesser24 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser24",categoryID,120,126,,true);
	var targetMappedID_Buzzcut_Lesser25 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser25",categoryID,95,126,,true);
	var targetMappedID_Buzzcut_Lesser26 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser26",categoryID,108,116,,true);
	var targetMappedID_Buzzcut_Lesser27 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser27",categoryID,102,116,,true);
	var targetMappedID_Buzzcut_Lesser28 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser28",categoryID,96,111,,true);
	var targetMappedID_Buzzcut_Lesser29 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser29",categoryID,83,111,,true);
	var targetMappedID_Buzzcut_Lesser30 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser30",categoryID,65,92,,true);
	var targetMappedID_Buzzcut_Lesser31 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser31",categoryID,80,95,,true);
	var targetMappedID_Buzzcut_Lesser32 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser32",categoryID,77,91,,true);
	var targetMappedID_Buzzcut_Lesser33 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser33",categoryID,114,58,,true);
	var targetMappedID_Buzzcut_Lesser34 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser34",categoryID,126,58,,true);
	var targetMappedID_Buzzcut_Lesser35 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser35",categoryID,135,67,,true);
	var targetMappedID_Buzzcut_Lesser36 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser36",categoryID,135,79,,true);
	var targetMappedID_Buzzcut_Lesser37 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser37",categoryID,126,88,,true);
	var targetMappedID_Buzzcut_Lesser38 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser38",categoryID,114,88,,true);
	var targetMappedID_Buzzcut_Lesser39 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser39",categoryID,105,79,,true);
	var targetMappedID_Buzzcut_Lesser40 = scr_MKSS_Upgrade_Init_Add("Buzzcut_Lesser40",categoryID,105,67,,true);
	#endregion
	
	#region Neighbor Setup
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_ReverseSlash,targetMappedID_Buzzcut_Finisher,,targetMappedID_Buzzcut_Overcharge,targetMappedID_Buzzcut_Lesser32);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Finisher,,targetMappedID_Buzzcut_ReverseSlash,targetMappedID_Buzzcut_Gigatorque);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Gigatorque,,targetMappedID_Buzzcut_Overcharge,,targetMappedID_Buzzcut_Finisher);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Overcharge,targetMappedID_Buzzcut_Gigatorque,,targetMappedID_Buzzcut_Lesser1,targetMappedID_Buzzcut_ReverseSlash);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser1,,,targetMappedID_Buzzcut_Lesser2,targetMappedID_Buzzcut_Overcharge);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser2,,targetMappedID_Buzzcut_Lesser3,targetMappedID_Buzzcut_Drillsaw,targetMappedID_Buzzcut_Lesser1);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Drillsaw,,targetMappedID_Buzzcut_Chainlings,,targetMappedID_Buzzcut_Lesser2);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Chainlings,targetMappedID_Buzzcut_Drillsaw,,,targetMappedID_Buzzcut_Lesser3);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser3,targetMappedID_Buzzcut_Lesser2,targetMappedID_Buzzcut_Lesser4,targetMappedID_Buzzcut_Chainlings);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser4,targetMappedID_Buzzcut_Lesser3,targetMappedID_Buzzcut_Lesser5,,targetMappedID_Buzzcut_Lesser33);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser5,targetMappedID_Buzzcut_Lesser4,targetMappedID_Buzzcut_Lesser7,targetMappedID_Buzzcut_SawBombard);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_SawBombard,,targetMappedID_Buzzcut_Lesser6,,targetMappedID_Buzzcut_Lesser5);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser6,targetMappedID_Buzzcut_SawBombard,,,targetMappedID_Buzzcut_Lesser7);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser7,targetMappedID_Buzzcut_Lesser5,targetMappedID_Buzzcut_Lesser8,targetMappedID_Buzzcut_Lesser6);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser8,targetMappedID_Buzzcut_Lesser7,targetMappedID_Buzzcut_Lesser9);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser9,targetMappedID_Buzzcut_Lesser8,targetMappedID_Buzzcut_Lesser10,,targetMappedID_Buzzcut_ChainChakram);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser10,targetMappedID_Buzzcut_Lesser9,,,targetMappedID_Buzzcut_Lesser11);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser11,targetMappedID_Buzzcut_ChainChakram,,targetMappedID_Buzzcut_Lesser10);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_ChainChakram,,targetMappedID_Buzzcut_Lesser11,targetMappedID_Buzzcut_Lesser9,targetMappedID_Buzzcut_Lesser12);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser12,,,targetMappedID_Buzzcut_ChainChakram,targetMappedID_Buzzcut_Lesser13);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser13,,targetMappedID_Buzzcut_Lesser14,targetMappedID_Buzzcut_Lesser12,targetMappedID_Buzzcut_Lesser16);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser14,targetMappedID_Buzzcut_Lesser13,,,targetMappedID_Buzzcut_Lesser15);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser15,targetMappedID_Buzzcut_Lesser16,,targetMappedID_Buzzcut_Lesser14);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser16,,targetMappedID_Buzzcut_Lesser15,targetMappedID_Buzzcut_Lesser13,targetMappedID_Buzzcut_Lesser17);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser17,,,targetMappedID_Buzzcut_Lesser16,targetMappedID_Buzzcut_Lesser18);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser18,targetMappedID_Buzzcut_Lesser21,,targetMappedID_Buzzcut_Lesser17,targetMappedID_Buzzcut_Lesser19);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser19,targetMappedID_Buzzcut_Lesser20,,targetMappedID_Buzzcut_Lesser18);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser20,,targetMappedID_Buzzcut_Lesser19,targetMappedID_Buzzcut_Lesser21);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser21,targetMappedID_Buzzcut_Lesser22,targetMappedID_Buzzcut_Lesser18,,targetMappedID_Buzzcut_Lesser20);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser22,targetMappedID_Buzzcut_Lesser23,targetMappedID_Buzzcut_Lesser21);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser23,targetMappedID_Buzzcut_Lesser26,targetMappedID_Buzzcut_Lesser22,,targetMappedID_Buzzcut_Lesser24);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser24,targetMappedID_Buzzcut_Lesser25,,targetMappedID_Buzzcut_Lesser23);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser25,,targetMappedID_Buzzcut_Lesser24,targetMappedID_Buzzcut_Lesser26);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser26,targetMappedID_Buzzcut_Lesser27,targetMappedID_Buzzcut_Lesser23,,targetMappedID_Buzzcut_Lesser25);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser27,targetMappedID_Buzzcut_Lesser28,targetMappedID_Buzzcut_Lesser26);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser28,targetMappedID_Buzzcut_Lesser29,targetMappedID_Buzzcut_Lesser27,targetMappedID_Buzzcut_Lesser31);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser29,,targetMappedID_Buzzcut_Lesser28,targetMappedID_Buzzcut_Lesser30);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser30,,targetMappedID_Buzzcut_Lesser31,,targetMappedID_Buzzcut_Lesser29);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser31,targetMappedID_Buzzcut_Lesser30,,targetMappedID_Buzzcut_Lesser32,targetMappedID_Buzzcut_Lesser28);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser32,,,targetMappedID_Buzzcut_ReverseSlash,targetMappedID_Buzzcut_Lesser31);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser33,targetMappedID_Buzzcut_Lesser40,targetMappedID_Buzzcut_Lesser34,targetMappedID_Buzzcut_Lesser4);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser34,targetMappedID_Buzzcut_Lesser33,targetMappedID_Buzzcut_Lesser35);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser35,targetMappedID_Buzzcut_Lesser34,,,targetMappedID_Buzzcut_Lesser36);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser36,targetMappedID_Buzzcut_Lesser37,,targetMappedID_Buzzcut_Lesser35);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser37,targetMappedID_Buzzcut_Lesser38,targetMappedID_Buzzcut_Lesser36);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser38,targetMappedID_Buzzcut_Lesser39,targetMappedID_Buzzcut_Lesser37);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser39,,targetMappedID_Buzzcut_Lesser38,targetMappedID_Buzzcut_Lesser40);
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Buzzcut_Lesser40,,targetMappedID_Buzzcut_Lesser33,,targetMappedID_Buzzcut_Lesser39);
	#endregion
	#endregion
	
	#region Whiplash
	var categoryID = global.MKSS_UpgradeTypeIDs[? "whiplash"];
	
	#region Upgrade Nodes
	var targetMappedID_Whiplash_Finisher = scr_MKSS_Upgrade_Init_Add("Whiplash_Finisher",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Whiplash_Finisher,"Finisher");
	#endregion
	
	#region Lesser Nodes
	var targetMappedID_Whiplash_Lesser1 = scr_MKSS_Upgrade_Init_Add("Whiplash_Lesser1",categoryID,65,91,,true);
	#endregion
	
	#region Neighbor Setup
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Whiplash_Finisher,targetMappedID_Whiplash_Lesser1);
	#endregion
	#endregion
	
	#region Trifecta
	var categoryID = global.MKSS_UpgradeTypeIDs[? "trifecta"];
	
	#region Upgrade Nodes
	var targetMappedID_Trifecta_Finisher = scr_MKSS_Upgrade_Init_Add("Trifecta_Finisher",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Trifecta_Finisher,"Finisher");
	#endregion
	
	#region Lesser Nodes
	var targetMappedID_Trifecta_Lesser1 = scr_MKSS_Upgrade_Init_Add("Trifecta_Lesser1",categoryID,65,91,,true);
	#endregion
	
	#region Neighbor Setup
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Trifecta_Finisher,targetMappedID_Trifecta_Lesser1);
	#endregion
	#endregion
	
	#region Stella
	var categoryID = global.MKSS_UpgradeTypeIDs[? "stella"];
	
	#region Upgrade Nodes
	var targetMappedID_Stella_Finisher = scr_MKSS_Upgrade_Init_Add("Stella_Finisher",categoryID,109,93);
	scr_MKSS_Upgrade_Init_Add_Info(targetMappedID_Stella_Finisher,"Finisher");
	#endregion
	
	#region Lesser Nodes
	var targetMappedID_Stella_Lesser1 = scr_MKSS_Upgrade_Init_Add("Stella_Lesser1",categoryID,65,91,,true);
	#endregion
	
	#region Neighbor Setup
	scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID_Stella_Finisher,targetMappedID_Stella_Lesser1);
	#endregion
	#endregion
	#endregion
}