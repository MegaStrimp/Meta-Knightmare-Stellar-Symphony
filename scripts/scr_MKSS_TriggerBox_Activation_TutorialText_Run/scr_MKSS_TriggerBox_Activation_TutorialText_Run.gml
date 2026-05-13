///@description MKSS - Trigger Box - Activation - Tutorial Text - Run

function scr_MKSS_TriggerBox_Activation_TutorialText_Run()
{
	with (obj_Player) scr_MKSS_Player_SetTutorialText("[rightIcon][rightIcon] Run",300);
	
	instance_destroy();
}