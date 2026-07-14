///@description MKSS - Concentrated Gem - Preset - Royal Reeve EX Red

function scr_MKSS_ConcentratedGem_Preset_RoyalReeveEXRed()
{
	scr_MKSS_ConcentratedGem_Create
	(
		global.MKSS_StageIDs[? "royalReeveEX"],
		global.MKSS_StageIDs[? "gemBoss2EX"],
		global.MKSS_CollectibleIDs[? "royalReeveEX_RedGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Red,
		"Royal Reeve EX [" + MKSS_Base_Color_RedGem + "]Red Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_RoyalReeveEX + "]VS. Starless ???[/color]"
	);
}