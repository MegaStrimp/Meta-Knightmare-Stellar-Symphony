///@description MKSS - Concentrated Gem - Preset - Ad Astra Blue

function scr_MKSS_ConcentratedGem_Preset_AdAstraBlue()
{
	scr_MKSS_ConcentratedGem_Create
	(
		global.MKSS_StageIDs[? "adAstra"],
		global.MKSS_StageIDs[? "gemArena5"],
		global.MKSS_CollectibleIDs[? "adAstra_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Blue,
		"Ad Astra [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_AdAstra + "]Ad Astra Enemy Ordeal[/color]"
	);
}