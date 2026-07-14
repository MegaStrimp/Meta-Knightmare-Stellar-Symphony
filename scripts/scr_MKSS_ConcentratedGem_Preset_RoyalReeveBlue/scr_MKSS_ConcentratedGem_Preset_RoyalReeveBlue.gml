///@description MKSS - Concentrated Gem - Preset - Royal Reeve Blue

function scr_MKSS_ConcentratedGem_Preset_RoyalReeveBlue(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "royalReeve"],
		global.MKSS_StageIDs[? "gemArena2"],
		global.MKSS_CollectibleIDs[? "royalReeve_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Blue,
		"Starry Shores [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_RoyalReeve + "]Royal Reeve Enemy Ordeal[/color]"
	);
}