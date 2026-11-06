///@description MKSS - Settings - Component - Border Art - Left

function scr_MKSS_Settings_Component_BorderArt_Left()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	global.MKSS_CurrentBorderArt = (global.MKSS_CurrentBorderArt + global.MKSS_BorderArtCount - 1) % global.MKSS_BorderArtCount;
	
	scr_MKSS_BorderArt_Change(global.MKSS_CurrentBorderArt);
}