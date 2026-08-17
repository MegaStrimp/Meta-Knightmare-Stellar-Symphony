///@description MKSS - NPC - Activation - False Idol - Next Dialogue 2

function scr_MKSS_NPC_Activation_FalseIdol_NextDialogue1_2()
{
	targetDialogueMappedID = global.MKSS_DialogueIDs[? "falseIdol_Halberd_3"];
	dialogueEndScript = scr_MKSS_NPC_Activation_FalseIdol_NextDialogue1_3;
	
	talkSprite = spr_MKSS_NPC_FalseIdol_Talk;
}