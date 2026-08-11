///@description MKSS - NPC - Activation - Paint Roller - Shuffle

function scr_MKSS_NPC_Activation_PaintRoller_Shuffle()
{
	global.MKSS_NPCStatus_TalkedToPaintRoller = true;
	
	targetDialogueMappedID = choose
	(
		global.MKSS_DialogueIDs[? "paintRoller_Halberd_2"],
		global.MKSS_DialogueIDs[? "paintRoller_Halberd_3"]
	);
}