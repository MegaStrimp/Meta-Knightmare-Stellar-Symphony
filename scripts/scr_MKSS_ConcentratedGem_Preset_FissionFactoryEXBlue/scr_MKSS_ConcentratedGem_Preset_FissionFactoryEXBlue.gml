///@description MKSS - Concentrated Gem - Preset - Fission FactoryEX Blue

function scr_MKSS_ConcentratedGem_Preset_FissionFactoryEXBlue(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "fissionFactoryEX"],
		global.MKSS_StageIDs[? "fissionFactoryOrdealEX"],
		global.MKSS_CollectibleIDs[? "fissionFactoryEX_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_BlueEX,
		"Fission Factory EX [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_FissionFactoryEX + "]Fission Factory EX Enemy Ordeal[/color]"
	);
}