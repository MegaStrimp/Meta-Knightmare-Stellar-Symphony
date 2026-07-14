///@description MKSS - Concentrated Gem - Preset - Starry Shores Red

function scr_MKSS_ConcentratedGem_Preset_StarryShoresRed()
{
	scr_MKSS_ConcentratedGem_Create
	(
		global.MKSS_StageIDs[? "starryShores"],
		global.MKSS_StageIDs[? "gemBoss1"],
		global.MKSS_CollectibleIDs[? "starryShores_RedGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Red,
		"Starry Shores [" + MKSS_Base_Color_RedGem + "]Red Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_StarryShores + "]VS. Starless ???[/color]"
	);
}