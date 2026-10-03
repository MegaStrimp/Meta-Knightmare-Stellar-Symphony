///@description MKSS - Settings - Component - Sfx - Left

function scr_MKSS_Settings_Component_Sfx_Left()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	global.soundVolume = max(0,global.soundVolume - .1);
}