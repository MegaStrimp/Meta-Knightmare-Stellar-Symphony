///@description MKSS - Save Data

function scr_MKSS_SaveData(file)
{
	var fileFinal = file;
	if (!global.isMobile) fileFinal = environment_get_variable("LOCALAPPDATA") + chr(92) + global.gameTitle + chr(92) + file;
	
	if (file_exists(fileFinal))
	{
		file_copy(fileFinal,string(fileFinal) + "_bak");
		file_delete(fileFinal);
	}
	
	ini_open(fileFinal);
	
	#region Save Status
	ini_write_string("saveStatus","versionNumber",global.versionNumber);
	#endregion
	
	#region Player Status
	for (var i = 0; i < global.maxPlayers; i++)
	{
		ini_write_real("playerStatus","sprayPaint_" + string(i),global.playerSprayPaint[i]);
		ini_write_real("playerStatus","familiar_" + string(i),global.MKSS_PlayerFamiliar[i]);
	}
	#endregion
	
	#region Weapon Status
	for (var i = 0; i < ds_map_size(global.MKSS_WeaponIDs); i++)
	{
		var weaponID = global.MKSS_WeaponList[i].ID;
		
		if (global.MKSS_WeaponList[i].isUnlocked)
		{
			ini_write_real("weaponStatus",string(weaponID) + "_IsUnlocked",global.MKSS_WeaponList[i].isUnlocked);
		}
	}
	#endregion
	
	#region Upgrade Type Status
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeTypeIDs); i++)
	{
		var weaponID = global.MKSS_UpgradeTypeList[i].ID;
		
		if (global.MKSS_UpgradeTypeList[i].isUnlocked)
		{
			ini_write_real("upgradeTypeStatus",string(weaponID) + "_IsUnlocked",global.MKSS_UpgradeTypeList[i].isUnlocked);
		}
	}
	#endregion
	
	#region Upgrade Status
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeIDs); i++)
	{
		var upgradeID = global.MKSS_UpgradeList[i].ID;
		
		if (!global.MKSS_UpgradeList[i].isLesserNode)
		{
			if (global.MKSS_UpgradeList[i].isUnlocked)
			{
				ini_write_real("upgradeStatus",string(upgradeID) + "_CanBeUnlocked",global.MKSS_UpgradeList[i].canBeUnlocked);
				ini_write_real("upgradeStatus",string(upgradeID) + "_IsUnlocked",global.MKSS_UpgradeList[i].isUnlocked);
			}
		}
	}
	#endregion
	
	#region Spray Paint Status
	for (var i = 0; i < ds_map_size(global.MKSS_SprayPaintIDs); i++)
	{
		var sprayPaintID = global.MKSS_SprayPaintList[i].ID;
		
		if (global.MKSS_SprayPaintList[i].isUnlocked)
		{
			ini_write_real("sprayPaintStatus",string(sprayPaintID) + "_IsUnlocked",global.MKSS_SprayPaintList[i].isUnlocked);
		}
	}
	#endregion
	
	#region Familiar Status
	for (var i = 0; i < ds_map_size(global.MKSS_FamiliarIDs); i++)
	{
		var familiarID = global.MKSS_FamiliarList[i].ID;
		
		if (global.MKSS_FamiliarList[i].isUnlocked)
		{
			ini_write_real("familiarStatus",string(familiarID) + "_IsUnlocked",global.MKSS_FamiliarList[i].isUnlocked);
		}
	}
	#endregion
	
	#region Stage Status
	for (var i = 0; i < ds_map_size(global.MKSS_StageIDs); i++)
	{
		var stageID = global.MKSS_StageList[i].ID;
		
		if (global.MKSS_StageList[i].isUnlocked)
		{
			ini_write_real("stageStatus",string(stageID) + "_IsUnlocked",global.MKSS_StageList[i].isUnlocked);
			ini_write_real("stageStatus",string(stageID) + "_IsBeaten",global.MKSS_StageList[i].isBeaten);
			ini_write_real("stageStatus",string(stageID) + "_EarnedHighScore",global.MKSS_StageList[i].earnedHighScore);
			ini_write_real("stageStatus",string(stageID) + "_EarnedMedal",global.MKSS_StageList[i].earnedMedal);
		}
	}
	#endregion
	
	ini_close();
	
	return fileFinal;
}