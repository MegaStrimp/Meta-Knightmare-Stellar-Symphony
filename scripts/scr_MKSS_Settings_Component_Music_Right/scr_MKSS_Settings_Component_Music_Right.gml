///@description MKSS - Settings - Component - Music - Right

function scr_MKSS_Settings_Component_Music_Right()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	global.musicVolume = min(global.musicVolume + .1,1);
}