///@description MKSS - Settings - Component - Music - Left

function scr_MKSS_Settings_Component_Music_Left()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	global.musicVolume = max(0,global.musicVolume - .1);
}