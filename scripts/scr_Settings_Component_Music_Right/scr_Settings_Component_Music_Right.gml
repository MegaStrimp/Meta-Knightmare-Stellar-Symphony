///@description Settings - Component - Music - Right

function scr_Settings_Component_Music_Right()
{
	//scr_PlaySfx(snd_KSW_ButtonChange);
	
	global.musicVolume = min(global.musicVolume + .1,1);
}