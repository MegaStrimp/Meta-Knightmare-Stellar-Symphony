///@description Settings - Component - Window Size - Select

function scr_Settings_Component_WindowSize_Select()
{
	if ((!global.isMobile) and (!global.isOpera))
	{
		//scr_PlaySfx(snd_KSW_ButtonChange);
		
		var scaleMax = max(floor(display_get_height() / global.gameHeight),1);
		scaleMax = max(scaleMax,1);
		
		global.windowScaleTarget += 1;
		if (global.windowScaleTarget > scaleMax) global.windowScaleTarget -= scaleMax;
	}
	else
	{
		//scr_PlaySfx(snd_KSW_ButtonNo);
	}
}