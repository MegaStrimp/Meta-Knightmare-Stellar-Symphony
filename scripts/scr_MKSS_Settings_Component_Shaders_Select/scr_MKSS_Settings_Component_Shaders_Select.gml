///@description MKSS - Settings - Component - Shaders - Select

function scr_MKSS_Settings_Component_Shaders_Select()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	global.shaders = !global.shaders;
}