///@description MKSS - Concentrated Gem - Preset - Ad AstraEX Blue

function scr_MKSS_ConcentratedGem_Preset_AdAstraEXBlue(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "adAstraEX"],
		global.MKSS_StageIDs[? "gemArena5EX"],
		global.MKSS_CollectibleIDs[? "adAstraEX_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_BlueEX,
		"Ad Astra EX [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_AdAstraEX + "]Ad Astra EX Enemy Ordeal[/color]"
	);
}