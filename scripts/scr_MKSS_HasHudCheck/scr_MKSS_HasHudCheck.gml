///@description MKSS - Has Hud Check

function scr_MKSS_HasHudCheck()
{
	var hasStageIntro = false;
	with (obj_MKSS_UI_StageIntro)
	{
		if (destroyTimer == -1) hasStageIntro = true;
	}
	
	var hasGemIntro = false;
	with (obj_MKSS_UI_GemIntro)
	{
		if (destroyTimer == -1) hasGemIntro = true;
	}
	
	var hasGemObtained = false;
	with (obj_MKSS_UI_GemObtained)
	{
		if (destroyTimer == -1) hasGemObtained = true;
	}
	
	var hasHud = ((!global.gamePause) and (!instance_exists(obj_MKSS_UI_NotifBox)) and (!hasStageIntro) and (!hasGemIntro) and (!instance_exists(obj_MKSS_UI_StageClear)) and (!instance_exists(obj_MKSS_UI_Death)) and (!hasGemObtained));
	
	return hasHud;
}