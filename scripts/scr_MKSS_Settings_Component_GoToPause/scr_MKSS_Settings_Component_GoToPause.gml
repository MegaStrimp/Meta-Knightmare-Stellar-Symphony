///@description MKSS - Settings - Component - Go To Pause

function scr_MKSS_Settings_Component_GoToPause()
{
	scr_MKSS_SaveConfig("config.ini");
	
	with (obj_FrameworkControl)
	{
		MKSS_GamePause_Locked = false;
		
		MKSS_GamePause_PauseButtonAlphaTarget = 1;
		MKSS_GamePause_UpgradesAlphaTarget = 1;
		MKSS_GamePause_Settings_TransitionXTarget = -150;
	}
	
	instance_destroy();
}