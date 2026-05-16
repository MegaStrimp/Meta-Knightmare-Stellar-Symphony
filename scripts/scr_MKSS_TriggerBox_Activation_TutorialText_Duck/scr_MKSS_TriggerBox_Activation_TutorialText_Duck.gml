///@description MKSS - Trigger Box - Activation - Tutorial Text - Duck

function scr_MKSS_TriggerBox_Activation_TutorialText_Duck()
{
	with (obj_Player) scr_MKSS_Player_SetTutorialText("[downIcon] Duck\n\n[downIcon]+[AIcon] Slide",300);
	
	instance_destroy();
}