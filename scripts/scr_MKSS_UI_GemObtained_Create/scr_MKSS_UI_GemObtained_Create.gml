///@description MKSS - UI - Gem Obtained - Create

function scr_MKSS_UI_GemObtained_Create(targetGemTitle = "",targetUnlockTitle = "",targetGemPalette = spr_MKSS_UI_GemObtained_Gem_Palette_Blue)
{
	global.canGamePause = false;
	
	with (instance_create_depth(0,0,0,obj_MKSS_UI_GemObtained))
	{
		gemTitle = targetGemTitle;
		unlockTitle = targetUnlockTitle;
		gemPalette = targetGemPalette;
	}
}