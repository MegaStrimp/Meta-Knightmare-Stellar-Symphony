///@description MKSS - Concentrated Gem - Preset - Starry Shores EX Blue

function scr_MKSS_ConcentratedGem_Preset_StarryShoresEXBlue()
{
	scr_MKSS_ConcentratedGem_Create
	(
		global.MKSS_StageIDs[? "starryShoresEX"],
		global.MKSS_StageIDs[? "gemArena1EX"],
		global.MKSS_CollectibleIDs[? "starryShoresEX_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Blue,
		"Starry Shores EX [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_StarryShoresEX + "]Starry Shores EX Enemy Ordeal[/color]"
	);
}