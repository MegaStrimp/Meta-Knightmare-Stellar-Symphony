///@description MKSS - Load Data

function scr_MKSS_LoadData(file,importFile = false)
{
	var fileFinal = file;
	if (!importFile)
	{
		if (!global.isMobile) fileFinal = environment_get_variable("LOCALAPPDATA") + chr(92) + global.gameTitle + chr(92) + file;
		
		if (!file_exists(fileFinal)) fileFinal = string(fileFinal) + "_bak";
	}
	
	ini_open(fileFinal);
	
	#region Player Status
	for (var i = 0; i < global.maxPlayers; i++)
	{
		global.playerSprayPaint[i] = ini_read_real("playerStatus","sprayPaint_" + string(i),global.MKSS_SprayPaintIDs[? "meta"]);
		global.MKSS_PlayerFamiliar[i] = ini_read_real("playerStatus","familiar_" + string(i),global.MKSS_FamiliarIDs[? "none"]);
	}
	#endregion
	
	#region Weapon Status
	for (var i = 0; i < ds_map_size(global.MKSS_WeaponIDs); i++)
	{
		var weaponID = global.MKSS_WeaponList[i].ID;
		
		var weaponIsUnlocked = ini_read_real("weaponStatus",string(weaponID) + "_IsUnlocked",false);
		if (global.MKSS_WeaponList[i].isDefault) weaponIsUnlocked = true;
		
		global.MKSS_WeaponList[i].isUnlocked = weaponIsUnlocked;
	}
	#endregion
	
	#region Upgrade Type Status
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeTypeIDs); i++)
	{
		var weaponID = global.MKSS_UpgradeTypeList[i].ID;
		
		var upgradeTypeIsUnlocked = ini_read_real("upgradeTypeStatus",string(weaponID) + "_IsUnlocked",false);
		if (global.MKSS_UpgradeTypeList[i].isDefault) upgradeTypeIsUnlocked = true;
		
		global.MKSS_UpgradeTypeList[i].isUnlocked = upgradeTypeIsUnlocked;
	}
	#endregion
	
	#region Upgrade Status
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeIDs); i++)
	{
		if (!global.MKSS_UpgradeList[i].isLesserNode)
		{
			var upgradeID = global.MKSS_UpgradeList[i].ID;
			
			var upgradeIsUnlocked = ini_read_real("upgradeStatus",string(upgradeID) + "_IsUnlocked",false);
			var upgradeCanBeUnlocked = ini_read_real("upgradeStatus",string(upgradeID) + "_CanBeUnlocked",global.MKSS_UpgradeList[i].canBeUnlocked);
			
			global.MKSS_UpgradeList[i].isUnlocked = upgradeIsUnlocked;
			global.MKSS_UpgradeList[i].canBeUnlocked = upgradeCanBeUnlocked;
		}
	}
	#endregion
	
	#region Spray Paint Status
	for (var i = 0; i < ds_map_size(global.MKSS_SprayPaintIDs); i++)
	{
		var sprayPaintID = global.MKSS_SprayPaintList[i].ID;
		
		var sprayPaintIsUnlocked = ini_read_real("sprayPaintStatus",string(sprayPaintID) + "_IsUnlocked",false);
		if (global.MKSS_SprayPaintList[i].isDefault) sprayPaintIsUnlocked = true;
		
		global.MKSS_SprayPaintList[i].isUnlocked = sprayPaintIsUnlocked;
	}
	#endregion
	
	#region Familiar Status
	for (var i = 0; i < ds_map_size(global.MKSS_FamiliarIDs); i++)
	{
		var familiarID = global.MKSS_FamiliarList[i].ID;
		
		var familiarIsUnlocked = ini_read_real("familiarStatus",string(familiarID) + "_IsUnlocked",false);
		if (global.MKSS_FamiliarList[i].isDefault) familiarIsUnlocked = true;
		
		global.MKSS_FamiliarList[i].isUnlocked = familiarIsUnlocked;
	}
	#endregion
	
	#region Stage Status
	for (var i = 0; i < ds_map_size(global.MKSS_StageIDs); i++)
	{
		var stageID = global.MKSS_StageList[i].ID;
		
		var stageIsUnlocked = ini_read_real("stageStatus",string(stageID) + "_IsUnlocked",false);
		if (global.MKSS_StageList[i].isDefault) stageIsUnlocked = true;
		
		global.MKSS_StageList[i].isUnlocked = stageIsUnlocked;
		global.MKSS_StageList[i].isBeaten = ini_read_real("stageStatus",string(stageID) + "_IsBeaten",false);
		global.MKSS_StageList[i].earnedHighScore = ini_read_real("stageStatus",string(stageID) + "_EarnedHighScore",0);
		global.MKSS_StageList[i].earnedMedal = ini_read_real("stageStatus",string(stageID) + "_EarnedMedal",-1);
		
		var collectibles = global.MKSS_StageList[i].collectibles;
		
		for (var j = 0; j < array_length(collectibles); j++)
		{
			var currentCollectible = collectibles[j];
			
			global.MKSS_StageList[i].collectibles[j].isObtained = ini_read_real("stageStatus",string(stageID) + "_Collectible_" + string(currentCollectible.ID) + "_IsUnlocked",false);
		}
	}
	
	global.MKSS_BarrierIndex = ini_write_real("stageStatus","barrierIndex",0);
	#endregion
	
	ini_close();
}