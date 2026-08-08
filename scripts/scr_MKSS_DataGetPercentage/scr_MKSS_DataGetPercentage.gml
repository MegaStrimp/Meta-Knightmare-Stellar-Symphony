///@description MKSS - Data Get Percentage

function scr_MKSS_DataGetPercentage(file)
{
	var fileFinal = file;
	if (!global.isMobile) fileFinal = environment_get_variable("LOCALAPPDATA") + chr(92) + global.gameTitle + chr(92) + file;
	
	var totalWeight = 0;
	var addedWeight = 0;
	
	totalWeight += 1;
	if (file_exists(fileFinal))
	{
		addedWeight += 1;
	}
	
	ini_open(fileFinal);
	
	#region Weapon Status
	for (var i = 0; i < ds_map_size(global.MKSS_WeaponIDs); i++)
	{
		var weaponID = global.MKSS_WeaponList[i].ID;
		
		if (!global.MKSS_WeaponList[i].isDefault)
		{
			var weaponIsUnlocked = ini_read_real("weaponStatus",string(weaponID) + "_IsUnlocked",false);
			
			totalWeight += 1;
			if (weaponIsUnlocked)
			{
				addedWeight += 1;
			}
		}
	}
	#endregion
	
	#region Upgrade Type Status
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeTypeIDs); i++)
	{
		var weaponID = global.MKSS_UpgradeTypeList[i].ID;
		
		if (!global.MKSS_UpgradeTypeList[i].isDefault)
		{
			var upgradeTypeIsUnlocked = ini_read_real("upgradeTypeStatus",string(weaponID) + "_IsUnlocked",false);
			
			totalWeight += 1;
			if (upgradeTypeIsUnlocked)
			{
				addedWeight += 1;
			}
		}
	}
	#endregion
	
	#region Upgrade Status
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeIDs); i++)
	{
		if (!global.MKSS_UpgradeList[i].isLesserNode)
		{
			var upgradeID = global.MKSS_UpgradeList[i].ID;
			
			var upgradeIsUnlocked = ini_read_real("upgradeStatus",string(upgradeID) + "_IsUnlocked",false);
			
			totalWeight += MKSS_Base_DataPercentage_Upgrade;
			if (upgradeIsUnlocked)
			{
				addedWeight += MKSS_Base_DataPercentage_Upgrade;
			}
		}
	}
	#endregion
	
	#region Spray Paint Status
	for (var i = 0; i < ds_map_size(global.MKSS_SprayPaintIDs); i++)
	{
		var sprayPaintID = global.MKSS_SprayPaintList[i].ID;
		
		if (!global.MKSS_SprayPaintList[i].isDefault)
		{
			var sprayPaintIsUnlocked = ini_read_real("sprayPaintStatus",string(sprayPaintID) + "_IsUnlocked",false);
			
			totalWeight += 1;
			if (sprayPaintIsUnlocked)
			{
				addedWeight += 1;
			}
		}
	}
	#endregion
	
	#region Familiar Status
	for (var i = 0; i < ds_map_size(global.MKSS_FamiliarIDs); i++)
	{
		var familiarID = global.MKSS_FamiliarList[i].ID;
		
		if (!global.MKSS_FamiliarList[i].isDefault)
		{
			var familiarIsUnlocked = ini_read_real("familiarStatus",string(familiarID) + "_IsUnlocked",false);
			
			totalWeight += 1;
			if (familiarIsUnlocked)
			{
				addedWeight += 1;
			}
		}
	}
	#endregion
	
	#region Stage Status
	for (var i = 0; i < ds_map_size(global.MKSS_StageIDs); i++)
	{
		var stageID = global.MKSS_StageList[i].ID;
		
		if (!global.MKSS_StageList[i].isDefault)
		{
			var stageIsUnlocked = ini_read_real("stageStatus",string(stageID) + "_IsUnlocked",false);
			
			totalWeight += 1;
			if (stageIsUnlocked)
			{
				addedWeight += 1;
			}
			
			var stageMedal = ini_read_real("stageStatus",string(stageID) + "_EarnedMedal",false);
			
			totalWeight += 1;
			if (stageMedal)
			{
				addedWeight += 1;
			}
		}
		
		var stageIsBeaten = ini_read_real("stageStatus",string(stageID) + "_IsBeaten",false);
		
		totalWeight += 1;
		if (stageIsBeaten)
		{
			addedWeight += 1;
		}
	}
	#endregion
	
	ini_close();
	
	var finalPercentage = 0;
	if (addedWeight != 0) finalPercentage = ceil((addedWeight / totalWeight) * 100);
	
	return finalPercentage;
}