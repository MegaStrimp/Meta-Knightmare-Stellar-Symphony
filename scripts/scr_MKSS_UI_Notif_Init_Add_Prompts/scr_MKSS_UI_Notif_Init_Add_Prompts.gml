///@description MKSS - UI - Notif - Init - Add - Prompts

function scr_MKSS_UI_Notif_Init_Add_Prompts(targetID,targetNextText,targetNextScript,targetBackText,targetBackScript,inputDelayTimerTarget = 30)
{
	with (global.MKSS_NotifList[global.MKSS_NotifIDs[? targetID]])
	{
		nextText = targetNextText;
		nextScript = targetNextScript;
		backText = targetBackText;
		backScript = targetBackScript;
		inputDelayTimer = inputDelayTimerTarget;
    };
}