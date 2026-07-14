///@description MKSS - Concentrated Gem - Preset - Living Loom Blue

function scr_MKSS_ConcentratedGem_Preset_LivingLoomBlue(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "livingLoom"],
		global.MKSS_StageIDs[? "gemArena3"],
		global.MKSS_CollectibleIDs[? "livingLoom_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Blue,
		"Living Loom [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_LivingLoom + "]Living Loom Enemy Ordeal[/color]"
	);
}