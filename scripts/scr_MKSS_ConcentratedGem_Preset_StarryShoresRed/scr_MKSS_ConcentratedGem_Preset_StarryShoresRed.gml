///@description MKSS - Concentrated Gem - Preset - Starry Shores Red

function scr_MKSS_ConcentratedGem_Preset_StarryShoresRed(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "starryShores"],
		global.MKSS_StageIDs[? "gemBoss1"],
		global.MKSS_CollectibleIDs[? "starryShores_RedGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Red,
		"Starry Shores [" + MKSS_Base_Color_RedGem + "]Red Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_StarryShores + "]VS. Starless ???[/color]"
	);
}