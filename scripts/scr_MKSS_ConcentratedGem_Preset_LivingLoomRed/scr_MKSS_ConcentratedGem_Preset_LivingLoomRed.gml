///@description MKSS - Concentrated Gem - Preset - Living Loom Red

function scr_MKSS_ConcentratedGem_Preset_LivingLoomRed(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "livingLoom"],
		global.MKSS_StageIDs[? "VSStarlessZeroTwo"],
		global.MKSS_CollectibleIDs[? "livingLoom_RedGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Red,
		"Living Loom [" + MKSS_Base_Color_RedGem + "]Red Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_LivingLoom + "]VS. Starless ???[/color]"
	);
}