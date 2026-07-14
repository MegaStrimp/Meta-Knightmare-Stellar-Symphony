///@description MKSS - Concentrated Gem - Preset - Royal Reeve EX Blue

function scr_MKSS_ConcentratedGem_Preset_RoyalReeveEXBlue(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "royalReeveEX"],
		global.MKSS_StageIDs[? "gemArena2EX"],
		global.MKSS_CollectibleIDs[? "royalReeveEX_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_BlueEX,
		"Royal Reeve [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_RoyalReeveEX + "]Royal Reeve EX Enemy Ordeal[/color]"
	);
}