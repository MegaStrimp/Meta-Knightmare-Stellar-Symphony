///@description MKSS - Stage - Init - Set

function scr_MKSS_Stage_Init_Set()
{
	#region Setup
	global.MKSS_StageList = [];
	global.MKSS_StageIDs = ds_map_create();
	global.MKSS_CollectibleIDs = ds_map_create();
	#endregion
	
	#region Stages
	#region Ice Cream Island
	var stageID = "iceCreamIsland";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Ice Cream Island",[0,0,0,0],false);
	global.MKSS_StageList[targetMappedID].isDefault = true;
	#endregion
	
	#region Starry Shores
	var stageID = "starryShores";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Starry Shores",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_StarryShores);
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"starryShores_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"starryShores_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Royal Reeve
	var stageID = "royalReeve";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Royal Reeve",[100,200,300,400],,spr_MKSS_UI_Decal_Pal_RoyalReeve);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_RoyalReeve);
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"royalReeve_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"royalReeve_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Above Halberd
	var stageID = "aboveHalberd";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Above Halberd",[0,0,0,0],false);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Living Loom
	var stageID = "livingLoom";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Living Loom",[100,200,300,400],,spr_MKSS_UI_Decal_Pal_LivingLoom);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"livingLoom_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"livingLoom_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Fission Factory
	var stageID = "fissionFactory";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Fission Factory",[100,200,300,400],,spr_MKSS_UI_Decal_Pal_FissionFactory);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"fissionFactory_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"fissionFactory_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Ad Astra
	var stageID = "adAstra";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Ad Astra",[100,200,300,400],,spr_MKSS_UI_Decal_Pal_AdAstra);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"adAstra_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"adAstra_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Gem Arena 1
	var stageID = "gemArena1";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Starry Shores Enemy Ordeal",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_GemArena1);
	#endregion
	
	#region Gem Arena 2
	var stageID = "gemArena2";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Royal Reeve Enemy Ordeal",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_GemArena2);
	#endregion
	
	#region Gem Arena 3
	var stageID = "gemArena3";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Arena 3",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Arena 4
	var stageID = "gemArena4";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Arena 4",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Arena 5
	var stageID = "gemArena5";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Arena 5",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Boss 1
	var stageID = "gemBoss1";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Starless Nightmare",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_GemBoss1);
	#endregion
	
	#region Gem Boss 2
	var stageID = "gemBoss2";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"VS. Starless Marx",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_GemBoss2);
	#endregion
	
	#region Gem Boss 3
	var stageID = "gemBoss3";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Boss 3",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Boss 4
	var stageID = "gemBoss4";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Boss 4",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Boss 5
	var stageID = "gemBoss5";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Boss 5",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Starry Shores EX
	var stageID = "starryShoresEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Starry Shores EX",[100,200,300,400],,spr_MKSS_UI_Decal_Pal_StarryShoresEX);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"starryShoresEX_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"starryShoresEX_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Royal Reeve EX
	var stageID = "royalReeveEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Royal Reeve EX",[100,200,300,400],,spr_MKSS_UI_Decal_Pal_RoyalReeveEX);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"royalReeveEX_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"royalReeveEX_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Above Halberd
	var stageID = "aboveHalberdEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Above Halberd EX",[0,0,0,0],false);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Living Loom EX
	var stageID = "livingLoomEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Living Loom EX",[100,200,300,400],,spr_MKSS_UI_Decal_Pal_LivingLoomEX);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"livingLoomEX_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"livingLoomEX_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Fission Factory EX
	var stageID = "fissionFactoryEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Fission Factory EX",[100,200,300,400],,spr_MKSS_UI_Decal_Pal_FissionFactoryEX);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"fissionFactoryEX_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"fissionFactoryEX_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Ad Astra EX
	var stageID = "adAstraEX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Ad Astra EX",[100,200,300,400],,spr_MKSS_UI_Decal_Pal_AdAstraEX);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"adAstraEX_BlueGem",spr_MKSS_Stage_Collectible_Icon_BlueGem);
	scr_MKSS_Stage_Init_Add_Collectible(targetMappedID,"adAstraEX_RedGem",spr_MKSS_Stage_Collectible_Icon_RedGem);
	#endregion
	
	#region Gem Arena 1 EX
	var stageID = "gemArena1EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Arena 1 EX",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Arena 2 EX
	var stageID = "gemArena2EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Arena 2 EX",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Arena 3 EX
	var stageID = "gemArena3EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Arena 3 EX",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Arena 4 EX
	var stageID = "gemArena4EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Arena 4 EX",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Arena 5 EX
	var stageID = "gemArena5EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Arena 5 EX",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Boss 1 EX
	var stageID = "gemBoss1EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Boss 1 EX",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Boss 2 EX
	var stageID = "gemBoss2EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Boss 2 EX",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Boss 3 EX
	var stageID = "gemBoss3EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Boss 3 EX",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Boss 4 EX
	var stageID = "gemBoss4EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Boss 4 EX",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	
	#region Gem Boss 5 EX
	var stageID = "gemBoss5EX";
	
	var targetMappedID = scr_MKSS_Stage_Init_Add(stageID,"Gem Boss 5 EX",[100,200,300,400]);
	
	scr_MKSS_Stage_Init_Add_Icon(targetMappedID,spr_MKSS_Stage_Icon_Unknown);
	#endregion
	#endregion
}