///@description MKSS - Player - Unlock Weapon

function scr_MKSS_Player_UnlockWeapon(playerNum = 0,targetWeaponID)
{
	global.MKSS_WeaponList[targetWeaponID].isUnlocked = true;
	if (global.MKSS_WeaponList[targetWeaponID].upgradeTypeID != -1) global.MKSS_UpgradeTypeList[global.MKSS_WeaponList[targetWeaponID].upgradeTypeID].isUnlocked = true;
	
	for (var i = 0; i < ds_map_size(global.MKSS_UpgradeIDs); i++)
	{
		if ((global.MKSS_UpgradeTypeList[global.MKSS_UpgradeList[i].categoryID].isUnlocked) and ((global.MKSS_UpgradeList[i].dependency == -1) or (global.MKSS_UpgradeList[global.MKSS_UpgradeList[i].dependency].isUnlocked)))
		{
			global.MKSS_UpgradeList[i].canBeUnlocked = true;
		}
	}
	
	scr_MKSS_Player_SetWeapons(playerNum);
}