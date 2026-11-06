///@description MKSS - Settings - Component - Border Art - Select

function scr_MKSS_Settings_Component_BorderArt_Select()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	enum MKSS_BorderArtSettings
	{
		dynamic = -3,
		randomized = -2,
		none = -1,
		
	}
	
	global.MKSS_CurrentBorderArt = (global.MKSS_CurrentBorderArt + 1) % global.MKSS_BorderArtCount;
	
	scr_MKSS_BorderArt_Change(global.MKSS_CurrentBorderArt);
}