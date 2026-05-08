///@description Settings - Component - Fullscreen - Select

function scr_Settings_Component_Fullscreen_Select()
{
	if ((!global.isMobile) and (!global.isOpera))
	{
		//scr_PlaySfx(snd_KSW_ButtonChange);
		
		global.fullscreen = !global.fullscreen;
		window_set_fullscreen(global.fullscreen);
		
		scr_Screen_Setup(global.gameWidthTarget,global.gameHeightTarget,global.windowScaleTarget);
	}
	else
	{
		//scr_PlaySfx(snd_KSW_ButtonNo);
	}
}