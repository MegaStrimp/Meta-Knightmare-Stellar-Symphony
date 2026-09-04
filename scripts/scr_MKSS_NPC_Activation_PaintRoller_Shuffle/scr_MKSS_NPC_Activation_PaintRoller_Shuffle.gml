///@description MKSS - NPC - Activation - Paint Roller - Shuffle

function scr_MKSS_NPC_Activation_PaintRoller_Shuffle()
{
	global.MKSS_NPCStatus_TalkedToPaintRoller = true;
	scr_MKSS_SaveData(global.selectedSave);
	
	targetDialogueMappedID = choose
	(
		global.MKSS_DialogueIDs[? "paintRoller_Halberd_2"],
		global.MKSS_DialogueIDs[? "paintRoller_Halberd_3"]
	);
}