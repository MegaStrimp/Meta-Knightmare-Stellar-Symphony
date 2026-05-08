/// @description Create

#region Initialize Variables
#region Component Setup
scr_Component_ButtonInputTimer_Setup(5);
#endregion

#region Gameplay Variables
playerNum = 0;

localDialogue = -1;
dialogueID = 0;
dialogueIndex = 0;
dialogueLength = 0;

owner = -1;
portrait_Idle = undefined;
portrait_Talk = undefined;
currentPortrait = portrait_Idle;
portraitImageIndex = 0;
portraitTalkTimer = -1;
portraitTalkTimerMax = 10;
text = undefined;

finishScript = -1;

textSpeed = 1;
textSmoothness = 0;
textSound = -1;

disableHud = true;
disableGamePause = true;
disableMovement = true;

dialogueIsFlowing = false;

typist = scribble_typist();
typist.in(textSpeed,textSmoothness);
#endregion
#endregion