///@description MKSS - Trigger Box - Activation - Chasse Intro

function scr_MKSS_TriggerBox_Activation_ChasseIntro()
{
	with (instance_create_depth(0,0,0,obj_MKSS_Cutscene))
	{
		scr_MKSS_Cutscene_Preset_ChasseIntro();
	}
	
	instance_destroy();
}