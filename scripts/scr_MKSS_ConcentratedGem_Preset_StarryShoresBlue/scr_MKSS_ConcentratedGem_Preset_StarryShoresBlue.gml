///@description MKSS - Concentrated Gem - Preset - Starry Shores Blue

function scr_MKSS_ConcentratedGem_Preset_StarryShoresBlue(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "starryShores"],
		global.MKSS_StageIDs[? "gemArena1"],
		global.MKSS_CollectibleIDs[? "starryShores_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Blue,
		"Starry Shores [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_StarryShores + "]Starry Shores Enemy Ordeal[/color]"
	);
}