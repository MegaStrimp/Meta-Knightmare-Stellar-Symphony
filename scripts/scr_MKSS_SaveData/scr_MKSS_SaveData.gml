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
	
	#region Weapon Status
	for (var i = 0; i < ds_map_size(global.MKSS_WeaponIDs); i++)
	{
		var weaponID = global.MKSS_WeaponList[i].ID;
		
		if (global.MKSS_WeaponList[i].isUnlocked != false)
		{
			ini_write_real("weaponStatus",string(weaponID) + "_IsUnlocked",global.MKSS_WeaponList[i].isUnlocked);
		}
	}
	#endregion
	
	#region Stage Status
	for (var i = 0; i < ds_map_size(global.MKSS_StageIDs); i++)
	{
		var stageID = global.MKSS_StageList[i].ID;
		
		if (global.MKSS_StageList[i].isUnlocked != false)
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