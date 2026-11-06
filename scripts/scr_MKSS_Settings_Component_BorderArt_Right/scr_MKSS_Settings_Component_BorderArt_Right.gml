///@description MKSS - Settings - Component - Border Art - Right

function scr_MKSS_Settings_Component_BorderArt_Right()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	global.MKSS_CurrentBorderArt = (global.MKSS_CurrentBorderArt + 1) % global.MKSS_BorderArtCount;
	
	scr_MKSS_BorderArt_Change(global.MKSS_CurrentBorderArt);
}