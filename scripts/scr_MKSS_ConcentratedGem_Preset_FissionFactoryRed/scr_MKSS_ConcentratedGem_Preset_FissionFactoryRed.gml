///@description MKSS - Concentrated Gem - Preset - Fission Factory Red

function scr_MKSS_ConcentratedGem_Preset_FissionFactoryRed(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "fissionFactory"],
		global.MKSS_StageIDs[? "gemBoss4"],
		global.MKSS_CollectibleIDs[? "fissionFactory_RedGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Red,
		"Fission Factory [" + MKSS_Base_Color_RedGem + "]Red Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_FissionFactory + "]VS. Starless ???[/color]"
	);
}