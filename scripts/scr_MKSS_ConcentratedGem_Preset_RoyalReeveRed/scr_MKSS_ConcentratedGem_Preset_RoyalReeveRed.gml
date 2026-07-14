///@description MKSS - Concentrated Gem - Preset - Royal Reeve Red

function scr_MKSS_ConcentratedGem_Preset_RoyalReeveRed()
{
	scr_MKSS_ConcentratedGem_Create
	(
		global.MKSS_StageIDs[? "royalReeve"],
		global.MKSS_StageIDs[? "gemBoss2"],
		global.MKSS_CollectibleIDs[? "royalReeve_RedGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Red,
		"Royal Reeve [" + MKSS_Base_Color_RedGem + "]Red Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_RoyalReeve + "]VS. Starless ???[/color]"
	);
}