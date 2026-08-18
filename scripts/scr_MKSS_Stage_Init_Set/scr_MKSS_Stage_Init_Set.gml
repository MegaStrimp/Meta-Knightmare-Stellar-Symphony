///@description MKSS - Stage - Init - Set

function scr_MKSS_Stage_Init_Set()
{
	//STRIMPTODO Add notifs for unlocked stuff
	
	#region Setup
	global.MKSS_StageList = [];
	global.MKSS_StageIDs = ds_map_create();
	global.MKSS_CollectibleIDs = ds_map_create();
	#endregion
	
	#region Stages
	#region Ice Cream Island
	var stageID = "iceCreamIsland";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Ice Cream Island",rm_MKSS_IceCreamIsland_1,[0,0,0,0],false);
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	global.MKSS_StageList[targetMappedID].isDefault = true;
	#endregion
	
	#region Starry Shores
	var stageID = "starryShores";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Starry Shores",rm_MKSS_StarryShores_1,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_StarryShores);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_BarrierIndexTarget = 1;
		
		global.MKSS_StageList[global.MKSS_StageIDs[? "royalReeve"]].isUnlocked = true;
	});
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"starryShores_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"starryShores_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Royal Reeve
	var stageID = "royalReeve";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Royal Reeve",rm_MKSS_RoyalReeve_1,[100,200,300,400],,spr_MKSS_UI_Decal_Pal_RoyalReeve);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_RoyalReeve);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_StageList[global.MKSS_StageIDs[? "aboveHalberd"]].isUnlocked = true;
	});
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"royalReeve_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"royalReeve_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Above Halberd
	var stageID = "aboveHalberd";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Above Halberd",rm_MKSS_AboveHalberd,[0,0,0,0],false);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_BarrierIndexTarget = 2;
		
		global.MKSS_StageList[global.MKSS_StageIDs[? "livingLoom"]].isUnlocked = true;
	});
	#endregion
	
	#region Living Loom
	var stageID = "livingLoom";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Living Loom",rm_MKSS_LivingLoom_1,[100,200,300,400],,spr_MKSS_UI_Decal_Pal_LivingLoom);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_BarrierIndexTarget = 3;
		
		global.MKSS_StageList[global.MKSS_StageIDs[? "fissionFactory"]].isUnlocked = true;
	});
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"livingLoom_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"livingLoom_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Fission Factory
	var stageID = "fissionFactory";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Fission Factory",rm_MKSS_FissionFactory_1,[100,200,300,400],,spr_MKSS_UI_Decal_Pal_FissionFactory);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_BarrierIndexTarget = 4;
		
		global.MKSS_StageList[global.MKSS_StageIDs[? "adAstra"]].isUnlocked = true;
	});
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"fissionFactory_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"fissionFactory_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Ad Astra
	var stageID = "adAstra";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Ad Astra",rm_MKSS_AdAstra_1,[100,200,300,400],,spr_MKSS_UI_Decal_Pal_AdAstra);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_BarrierIndexTarget = 5;
	});
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"adAstra_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"adAstra_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Gem Arena 1
	var stageID = "gemArena1";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Starry Shores Enemy Ordeal",rm_MKSS_Gem_StarryShoresOrdeal,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_GemArena1);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_SprayPaintList[global.MKSS_SprayPaintIDs[? "starry"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Arena 2
	var stageID = "gemArena2";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Royal Reeve Enemy Ordeal",rm_MKSS_Gem_RoyalReeveOrdeal,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_GemArena2);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_SprayPaintList[global.MKSS_SprayPaintIDs[? "royal"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Arena 3
	var stageID = "gemArena3";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Living Loom Enemy Ordeal",rm_MKSS_Gem_LivingLoomOrdeal,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_SprayPaintList[global.MKSS_SprayPaintIDs[? "living"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Arena 4
	var stageID = "gemArena4";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Fission Factory Enemy Ordeal",rm_MKSS_Gem_FissionFactoryOrdeal,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_SprayPaintList[global.MKSS_SprayPaintIDs[? "fission"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Arena 5
	var stageID = "gemArena5";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Ad Astra Enemy Ordeal",rm_MKSS_Gem_AdAstraOrdeal,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_SprayPaintList[global.MKSS_SprayPaintIDs[? "astra"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Boss 1
	var stageID = "gemBoss1";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Starless Nightmare",,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_GemBoss1);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_SprayPaintList[global.MKSS_SprayPaintIDs[? "wizard"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Boss 2
	var stageID = "gemBoss2";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Starless Marx",rm_MKSS_Gem_StarlessMarx,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_GemBoss2);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_SprayPaintList[global.MKSS_SprayPaintIDs[? "jester"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Boss 3
	var stageID = "gemBoss3";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Someone",,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_SprayPaintList[global.MKSS_SprayPaintIDs[? "angel"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Boss 4
	var stageID = "gemBoss4";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Someone",,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_SprayPaintList[global.MKSS_SprayPaintIDs[? "mind"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Boss 5
	var stageID = "gemBoss5";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Someone",,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_SprayPaintList[global.MKSS_SprayPaintIDs[? "nebula"]].isUnlocked = true;
	});
	#endregion
	
	#region Starry Shores EX
	var stageID = "starryShoresEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Starry Shores EX",rm_MKSS_StarryShoresEX_1,[100,200,300,400],,spr_MKSS_UI_Decal_Pal_StarryShoresEX);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_StageList[global.MKSS_StageIDs[? "royalReeveEX"]].isUnlocked = true;
	});
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"starryShoresEX_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"starryShoresEX_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Royal Reeve EX
	var stageID = "royalReeveEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Royal Reeve EX",rm_MKSS_RoyalReeveEX_1,[100,200,300,400],,spr_MKSS_UI_Decal_Pal_RoyalReeveEX);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_StageList[global.MKSS_StageIDs[? "aboveHalberdEX"]].isUnlocked = true;
	});
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"royalReeveEX_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"royalReeveEX_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Above Halberd
	var stageID = "aboveHalberdEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Above Halberd EX",,[0,0,0,0],false);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_StageList[global.MKSS_StageIDs[? "livingLoomEX"]].isUnlocked = true;
	});
	#endregion
	
	#region Living Loom EX
	var stageID = "livingLoomEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Living Loom EX",rm_MKSS_LivingLoomEX_1,[100,200,300,400],,spr_MKSS_UI_Decal_Pal_LivingLoomEX);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_StageList[global.MKSS_StageIDs[? "fissionFactoryEX"]].isUnlocked = true;
	});
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"livingLoomEX_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"livingLoomEX_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Fission Factory EX
	var stageID = "fissionFactoryEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Fission Factory EX",rm_MKSS_FissionFactoryEX_1,[100,200,300,400],,spr_MKSS_UI_Decal_Pal_FissionFactoryEX);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_StageList[global.MKSS_StageIDs[? "adAstraEX"]].isUnlocked = true;
	});
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"fissionFactoryEX_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"fissionFactoryEX_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Ad Astra EX
	var stageID = "adAstraEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Ad Astra EX",rm_MKSS_AdAstraEX_1,[100,200,300,400],,spr_MKSS_UI_Decal_Pal_AdAstraEX);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"adAstraEX_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"adAstraEX_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Gem Arena 1 EX
	var stageID = "gemArena1EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Starry Shores Enemy Ordeal EX",rm_MKSS_Gem_StarryShoresEXOrdeal,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? "stage1"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Arena 2 EX
	var stageID = "gemArena2EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Royal Reeve Enemy Ordeal EX",rm_MKSS_Gem_RoyalReeveEXOrdeal,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? "stage2"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Arena 3 EX
	var stageID = "gemArena3EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Living Loom Enemy Ordeal EX",rm_MKSS_Gem_LivingLoomEXOrdeal,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? "stage3"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Arena 4 EX
	var stageID = "gemArena4EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Fission Factory Enemy Ordeal EX",rm_MKSS_Gem_FissionFactoryEXOrdeal,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? "stage4"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Arena 5 EX
	var stageID = "gemArena5EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Ad Astra Enemy Ordeal EX",rm_MKSS_Gem_AdAstraEXOrdeal,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? "stage5"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Boss 1 EX
	var stageID = "gemBoss1EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Starless Nightmare EX",,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? "boss1"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Boss 2 EX
	var stageID = "gemBoss2EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Starless Marx EX",,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? "boss2"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Boss 3 EX
	var stageID = "gemBoss3EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Someone EX",,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? "boss3"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Boss 4 EX
	var stageID = "gemBoss4EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Someone EX",,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? "boss4"]].isUnlocked = true;
	});
	#endregion
	
	#region Gem Boss 5 EX
	var stageID = "gemBoss5EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Someone EX",,[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_ClearScript(targetMappedID,function(targetMappedID)
	{
		global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? "boss5"]].isUnlocked = true;
	});
	#endregion
	#endregion
}