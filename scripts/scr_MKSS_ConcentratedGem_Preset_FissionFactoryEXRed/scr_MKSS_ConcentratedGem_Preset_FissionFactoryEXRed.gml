///@description MKSS - Concentrated Gem - Preset - Fission Factory EX Red

function scr_MKSS_ConcentratedGem_Preset_FissionFactoryEXRed(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "fissionFactoryEX"],
		global.MKSS_StageIDs[? "VSStarlessMindEX"],
		global.MKSS_CollectibleIDs[? "fissionFactoryEX_RedGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_RedEX,
		"Fission Factory EX [" + MKSS_Base_Color_RedGem + "]Red Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_FissionFactoryEX + "]VS. Starless ???[/color]"
	);
}