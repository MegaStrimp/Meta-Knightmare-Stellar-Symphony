///@description MKSS - Concentrated Gem - Preset - Starry Shores EX Blue

function scr_MKSS_ConcentratedGem_Preset_StarryShoresEXBlue(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "starryShoresEX"],
		global.MKSS_StageIDs[? "starryShoresOrdealEX"],
		global.MKSS_CollectibleIDs[? "starryShoresEX_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_BlueEX,
		"Starry Shores EX [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_StarryShoresEX + "]Starry Shores EX Enemy Ordeal[/color]"
	);
}