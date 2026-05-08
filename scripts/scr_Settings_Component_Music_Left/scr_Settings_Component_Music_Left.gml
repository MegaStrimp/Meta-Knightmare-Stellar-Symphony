///@description Settings - Component - Music - Left

function scr_Settings_Component_Music_Left()
{
	//scr_PlaySfx(snd_KSW_ButtonChange);
	
	global.musicVolume = max(0,global.musicVolume - .1);
}