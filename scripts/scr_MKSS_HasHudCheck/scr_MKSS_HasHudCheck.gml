///@description MKSS - Has Hud Check

function scr_MKSS_HasHudCheck()
{
	var hasHud = ((!instance_exists(obj_MKSS_UI_NotifBox)) and (!instance_exists(obj_MKSS_UI_StageIntro)) and (!instance_exists(obj_MKSS_UI_GemIntro)) and (!instance_exists(obj_MKSS_UI_StageClear)) and (!instance_exists(obj_MKSS_UI_Death)));
	
	return hasHud;
}