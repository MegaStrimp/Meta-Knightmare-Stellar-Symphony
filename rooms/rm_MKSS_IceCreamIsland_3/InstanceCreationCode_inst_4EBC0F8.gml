if (!global.MKSS_UpgradeList[global.MKSS_UpgradeIDs[? "Base_Parry"]].isUnlocked)
{
	conditionScript = scr_MKSS_ConditionChecker_Condition_HaveMetaPoints;
	conditionScriptArgs = [MKSS_Base_UpgradeValue_Parry];
	triggerScript = function()
	{
		with (obj_Player) scr_MKSS_Player_SetTutorialText("[startIcon] Pause & Upgrade");
		global.MKSS_Tutorial_FirstUpgrade = true;
	};
}
else
{
	instance_destroy();
}