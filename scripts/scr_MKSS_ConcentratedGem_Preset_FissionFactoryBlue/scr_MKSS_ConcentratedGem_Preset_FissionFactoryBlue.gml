///@description MKSS - Concentrated Gem - Preset - Fission Factory Blue

function scr_MKSS_ConcentratedGem_Preset_FissionFactoryBlue(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "fissionFactory"],
		global.MKSS_StageIDs[? "gemArena4"],
		global.MKSS_CollectibleIDs[? "fissionFactory_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Blue,
		"Fission Factory [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_FissionFactory + "]Fission Factory Enemy Ordeal[/color]"
	);
}