///@description Settings - Component - Sfx - Right

function scr_Settings_Component_Sfx_Right()
{
	//scr_PlaySfx(snd_KSW_ButtonChange);
	
	global.soundVolume = min(global.soundVolume + .1,1);
}