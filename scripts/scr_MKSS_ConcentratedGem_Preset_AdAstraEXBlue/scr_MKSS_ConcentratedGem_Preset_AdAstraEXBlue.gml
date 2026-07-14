///@description MKSS - Concentrated Gem - Preset - Ad AstraEX Blue

function scr_MKSS_ConcentratedGem_Preset_AdAstraEXBlue()
{
	scr_MKSS_ConcentratedGem_Create
	(
		global.MKSS_StageIDs[? "adAstraEX"],
		global.MKSS_StageIDs[? "gemArena5EX"],
		global.MKSS_CollectibleIDs[? "adAstraEX_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Blue,
		"Ad Astra EX [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_AdAstraEX + "]Ad Astra EX Enemy Ordeal[/color]"
	);
}