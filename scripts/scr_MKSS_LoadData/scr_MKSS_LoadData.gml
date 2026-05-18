///@description MKSS - Load Data

function scr_MKSS_LoadData(file,importFile = false)
{
	if (importFile)
	{
		fileFinal = file;
	}
	else
	{
		var fileFinal = file;
		if (!global.isMobile) fileFinal = environment_get_variable("LOCALAPPDATA") + chr(92) + global.gameTitle + chr(92) + file;
		
		if (!file_exists(fileFinal)) fileFinal = string(fileFinal) + "_bak";
	}
	
	ini_open(fileFinal);
	
	#region Weapon Status
	for (var i = 0; i < ds_map_size(global.MKSS_WeaponIDs); i++)
	{
		var weaponID = global.MKSS_WeaponList[i].ID;
		
		var weaponIsUnlocked = ini_read_real("weaponStatus",string(weaponID) + "_IsUnlocked",false);
		if (global.MKSS_WeaponList[i].isDefault) weaponIsUnlocked = true;
		
		global.MKSS_WeaponList[i].isUnlocked = weaponIsUnlocked;
	}
	#endregion
	
	#region Upgrade Status
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeIDs); i++)
	{
		if (!global.MKSS_UpgradeList[i].isLesserNode)
		{
			var upgradeID = global.MKSS_UpgradeList[i].ID;
			
			var upgradeIsUnlocked = ini_read_real("upgradeStatus",string(upgradeID) + "_IsUnlocked",false);
			
			global.MKSS_UpgradeList[i].isUnlocked = upgradeIsUnlocked;
		}
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
	}
	#endregion
	
	ini_close();
}