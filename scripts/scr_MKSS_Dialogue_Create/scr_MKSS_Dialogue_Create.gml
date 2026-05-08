///@description MKSS - Dialogue - Create

function scr_MKSS_Dialogue_Create(targetDialogueID = 0,targetDialogueIndex = 0,targetOwner = -1,targetDisableHud = true,targetDisableGamePause = true,targetDisableMovement = true)
{
	with (obj_MKSS_UI_Dialogue) instance_destroy();
	
	with (instance_create_depth(0,0,-100,obj_MKSS_UI_Dialogue))
	{
		dialogueID = targetDialogueID;
		dialogueIndex = targetDialogueIndex;
		owner = targetOwner;
		localDialogue = global.MKSS_DialogueList[dialogueID];
		
		portrait_Idle = localDialogue.dialogue[dialogueIndex].portrait_Idle;
		portrait_Talk = localDialogue.dialogue[dialogueIndex].portrait_Talk;
		currentPortrait = portrait_Idle;
		text = localDialogue.dialogue[dialogueIndex].text;
		textSpeed = localDialogue.dialogue[dialogueIndex].textSpeed;
		textSound = localDialogue.dialogue[dialogueIndex].textSound;
		dialogueLength = array_length(localDialogue.dialogue)
		textSpeed = .25;
		typist.in(textSpeed,textSmoothness);
		
		disableHud = targetDisableHud;
		disableGamePause = targetDisableGamePause;
		disableMovement = targetDisableMovement;
	}
	
	if (targetDisableHud) global.hasHud = false;
	if (targetDisableGamePause) global.canGamePause = false;
	if (targetDisableMovement) global.MKSS_CutsceneStopMovement = true;
}