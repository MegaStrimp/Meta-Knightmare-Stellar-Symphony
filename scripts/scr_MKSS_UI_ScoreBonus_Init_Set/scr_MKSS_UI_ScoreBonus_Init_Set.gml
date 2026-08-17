///@description MKSS - UI - Score Bonus - Init - Set

function scr_MKSS_UI_ScoreBonus_Init_Set()
{
	#region Setup
	global.MKSS_ScoreBonusList = [];
	global.MKSS_ScoreBonusIDs = ds_map_create();
	#endregion
	
	#region Stages
	#region First Time Clear
	var unlockScript = function()
	{
		return (!global.MKSS_StageList[global.MKSS_StageIDs[? global.currentStage]].isBeaten);
	};
	
	scr_MKSS_UI_ScoreBonus_Init_Add("firstTimeClear",unlockScript,150,spr_MKSS_UI_ScoreBonus_FirstTimeClear);
	#endregion
	
	#region No Damage
	var unlockScript = function()
	{
		return (global.MKSS_NoDamage);
	};
	
	scr_MKSS_UI_ScoreBonus_Init_Add("noDamage",unlockScript,500,spr_MKSS_UI_ScoreBonus_NoDamage);
	#endregion
	#endregion
}