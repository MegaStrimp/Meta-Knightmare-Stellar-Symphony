conditionScript = scr_MKSS_ConditionChecker_Condition_NumberOfObjects;
conditionScriptArgs = [obj_MKSS_StarBlock,0,1];
triggerScript = function()
{
	with (instance_create_depth(0,0,0,obj_MKSS_Cutscene))
	{
		scr_MKSS_Cutscene_Preset_RoyalReeveDevRoom();
	}
};