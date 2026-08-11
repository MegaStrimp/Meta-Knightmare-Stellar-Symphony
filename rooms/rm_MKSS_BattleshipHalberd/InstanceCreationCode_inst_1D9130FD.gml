if (global.MKSS_NPCStatus_TalkedToCaptainVul)
{
	targetDialogueMappedID = global.MKSS_DialogueIDs[? "captainVul_Halberd_2"];
}
else
{
	targetDialogueMappedID = global.MKSS_DialogueIDs[? "captainVul_Halberd_1"];
}

dialogueEndScript = scr_MKSS_NPC_Activation_CaptainVul_Shuffle;