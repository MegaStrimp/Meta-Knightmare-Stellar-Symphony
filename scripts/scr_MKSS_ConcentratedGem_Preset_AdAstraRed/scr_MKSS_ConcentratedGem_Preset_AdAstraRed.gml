///@description MKSS - Concentrated Gem - Preset - Ad Astra Red

function scr_MKSS_ConcentratedGem_Preset_AdAstraRed()
{
	scr_MKSS_ConcentratedGem_Create
	(
		global.MKSS_StageIDs[? "adAstra"],
		global.MKSS_StageIDs[? "gemBoss5"],
		global.MKSS_CollectibleIDs[? "adAstra_RedGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Red,
		"Ad Astra [" + MKSS_Base_Color_RedGem + "]Red Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_AdAstra + "]VS. Starless ???[/color]"
	);
}