///@description MKSS - Trigger Box - Activation - Chasse Intro

function scr_MKSS_TriggerBox_Activation_ChasseIntro()
{
	instance_create_depth(0,0,0,obj_MKSS_Cutscene_ChasseIntro);
	
	instance_destroy();
}