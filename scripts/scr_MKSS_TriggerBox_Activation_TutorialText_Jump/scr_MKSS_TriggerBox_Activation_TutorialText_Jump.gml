///@description MKSS - Trigger Box - Activation - Tutorial Text - Jump

function scr_MKSS_TriggerBox_Activation_TutorialText_Jump()
{
	with (obj_Player) scr_MKSS_Player_SetTutorialText("[AIcon] Jump\n\n[AIcon]+[AIcon] Fly",300);
	
	instance_destroy();
}