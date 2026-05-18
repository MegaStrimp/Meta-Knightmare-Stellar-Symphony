///@description MKSS - Upgrade Type - Unlock

function scr_MKSS_UpgradeType_Unlock(targetID)
{
	global.MKSS_UpgradeTypeList[targetID].isUnlocked = true;
}