///@description Settings - Component - Sfx - Left

function scr_Settings_Component_Sfx_Left()
{
	//scr_PlaySfx(snd_KSW_ButtonChange);
	
	global.soundVolume = max(0,global.soundVolume - .1);
}