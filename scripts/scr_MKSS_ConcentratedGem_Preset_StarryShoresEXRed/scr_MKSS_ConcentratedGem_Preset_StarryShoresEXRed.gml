///@description MKSS - Concentrated Gem - Preset - Starry Shores EX Red

function scr_MKSS_ConcentratedGem_Preset_StarryShoresEXRed()
{
	scr_MKSS_ConcentratedGem_Create
	(
		global.MKSS_StageIDs[? "starryShoresEX"],
		global.MKSS_StageIDs[? "gemBoss1EX"],
		global.MKSS_CollectibleIDs[? "starryShoresEX_RedGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Red,
		"Starry Shores EX [" + MKSS_Base_Color_RedGem + "]Red Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_StarryShoresEX + "]VS. Starless ???[/color]"
	);
}