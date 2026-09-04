///@description MKSS - NPC - Activation - Captain Vul - Shuffle

function scr_MKSS_NPC_Activation_CaptainVul_Shuffle()
{
	global.MKSS_NPCStatus_TalkedToCaptainVul = true;
	scr_MKSS_SaveData(global.selectedSave);
	
	targetDialogueMappedID = global.MKSS_DialogueIDs[? "captainVul_Halberd_2"];
}