///@description Settings - Component - Shaders - Select

function scr_Settings_Component_Shaders_Select()
{
	if ((!global.isMobile) and (!global.isOpera))
	{
		//scr_PlaySfx(snd_KSW_ButtonChange);
		
		global.shaders = !global.shaders;
	}
	else
	{
		//scr_PlaySfx(snd_KSW_ButtonNo);
	}
}