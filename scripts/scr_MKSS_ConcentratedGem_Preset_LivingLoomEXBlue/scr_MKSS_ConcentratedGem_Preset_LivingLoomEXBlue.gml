///@description MKSS - Concentrated Gem - Preset - Living Loom EX Blue

function scr_MKSS_ConcentratedGem_Preset_LivingLoomEXBlue()
{
	scr_MKSS_ConcentratedGem_Create
	(
		global.MKSS_StageIDs[? "livingLoomEX"],
		global.MKSS_StageIDs[? "gemArena3EX"],
		global.MKSS_CollectibleIDs[? "livingLoomEX_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_Blue,
		"Living Loom EX [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_LivingLoomEX + "]Living Loom EX Enemy Ordeal[/color]"
	);
}