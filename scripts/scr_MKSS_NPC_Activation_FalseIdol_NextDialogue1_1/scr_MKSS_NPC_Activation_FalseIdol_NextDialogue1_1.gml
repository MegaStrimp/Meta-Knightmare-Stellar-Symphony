///@description MKSS - NPC - Activation - False Idol - Next Dialogue 1

function scr_MKSS_NPC_Activation_FalseIdol_NextDialogue1_1()
{
	targetDialogueMappedID = global.MKSS_DialogueIDs[? "falseIdol_Halberd_2"];
	dialogueEndScript = scr_MKSS_NPC_Activation_FalseIdol_NextDialogue1_2;
	
	talkSprite = spr_MKSS_NPC_FalseIdol_Douche;
}