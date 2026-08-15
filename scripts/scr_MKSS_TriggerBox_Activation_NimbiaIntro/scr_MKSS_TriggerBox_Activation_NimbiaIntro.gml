///@description MKSS - Trigger Box - Activation - Nimbia Intro

function scr_MKSS_TriggerBox_Activation_NimbiaIntro()
{
	with (instance_create_depth(0,0,0,obj_MKSS_Cutscene))
	{
		scr_MKSS_Cutscene_Preset_NimbiaIntro();
	}
	
	instance_destroy();
}