///@description MKSS - Concentrated Gem - Preset - Ad Astra EX Red

function scr_MKSS_ConcentratedGem_Preset_AdAstraEXRed()
{
	scr_MKSS_ConcentratedGem_Create
	(
		global.MKSS_StageIDs[? "adAstraEX"],
		global.MKSS_StageIDs[? "gemBoss5EX"],
		global.MKSS_CollectibleIDs[? "adAstraEX_RedGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Red,
		"Ad Astra EX [" + MKSS_Base_Color_RedGem + "]Red Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_AdAstraEX + "]VS. Starless ???[/color]"
	);
}