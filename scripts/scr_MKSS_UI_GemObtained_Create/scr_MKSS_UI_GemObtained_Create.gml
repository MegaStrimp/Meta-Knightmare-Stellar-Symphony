///@description MKSS - UI - Gem Obtained - Create

function scr_MKSS_UI_GemObtained_Create(targetGemPalette = spr_MKSS_UI_GemObtained_Gem_Palette_Blue)
{
	with (instance_create_depth(0,0,0,obj_MKSS_UI_GemObtained))
	{
		gemPalette = targetGemPalette;
	}
}