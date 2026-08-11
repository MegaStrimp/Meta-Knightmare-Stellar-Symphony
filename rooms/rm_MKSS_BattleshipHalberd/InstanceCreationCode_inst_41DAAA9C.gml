if (global.MKSS_NPCStatus_TalkedToPaintRoller)
{
	targetDialogueMappedID = choose
	(
		global.MKSS_DialogueIDs[? "paintRoller_Halberd_2"],
		global.MKSS_DialogueIDs[? "paintRoller_Halberd_3"]
	);
}
else
{
	targetDialogueMappedID = global.MKSS_DialogueIDs[? "paintRoller_Halberd_1"];
}

dialogueEndScript = scr_MKSS_NPC_Activation_PaintRoller_Shuffle;

isVisible = false;