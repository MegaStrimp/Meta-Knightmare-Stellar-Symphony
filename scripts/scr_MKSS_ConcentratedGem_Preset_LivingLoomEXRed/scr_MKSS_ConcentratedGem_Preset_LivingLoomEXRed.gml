///@description MKSS - Concentrated Gem - Preset - Living Loom EX Red

function scr_MKSS_ConcentratedGem_Preset_LivingLoomEXRed()
{
	scr_MKSS_ConcentratedGem_Create
	(
		global.MKSS_StageIDs[? "livingLoomEX"],
		global.MKSS_StageIDs[? "gemBoss3EX"],
		global.MKSS_CollectibleIDs[? "livingLoomEX_RedGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Red,
		"Living Loom EX [" + MKSS_Base_Color_RedGem + "]Red Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_LivingLoomEX + "]VS. Starless ???[/color]"
	);
}