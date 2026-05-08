///@description Settings - Component - Window Size - Left

function scr_Settings_Component_WindowSize_Left()
{
	if ((!global.isMobile) and (!global.isOpera))
	{
		//scr_PlaySfx(snd_KSW_ButtonChange);
		
		var scaleMax = max(floor(display_get_height() / global.gameHeight),1);
		scaleMax = max(scaleMax,1);
		
		global.windowScaleTarget -= 1;
		if (global.windowScaleTarget <= 0) global.windowScaleTarget += scaleMax;
	}
	else
	{
		//scr_PlaySfx(snd_KSW_ButtonNo);
	}
}