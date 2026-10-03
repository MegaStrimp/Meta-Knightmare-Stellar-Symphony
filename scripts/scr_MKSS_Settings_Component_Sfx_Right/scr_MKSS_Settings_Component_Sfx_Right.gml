///@description MKSS - Settings - Component - Sfx - Right

function scr_MKSS_Settings_Component_Sfx_Right()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	global.soundVolume = min(global.soundVolume + .1,1);
}