///@description MKSS - Concentrated Gem - Preset - Living Loom EX Blue

function scr_MKSS_ConcentratedGem_Preset_LivingLoomEXBlue(targetX,targetY)
{
	scr_MKSS_ConcentratedGem_Create
	(
		targetX,targetY,
		global.MKSS_StageIDs[? "livingLoomEX"],
		global.MKSS_StageIDs[? "livingLoomOrdealEX"],
		global.MKSS_CollectibleIDs[? "livingLoomEX_BlueGem"],
		spr_MKSS_UI_GemObtained_Gem_Palette_BlueEX,
		"Living Loom EX [" + MKSS_Base_Color_BlueGem + "]Blue Gem[/color] Obtained!",
		"[" + MKSS_Base_Color_LivingLoomEX + "]Living Loom EX Enemy Ordeal[/color]"
	);
}