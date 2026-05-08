///@description MKSS - Player - Tutorial Text

function scr_MKSS_Player_SetTutorialText(targetText,targetTimer = -1)
{
	tutorialText = targetText;
	tutorialTextAlpha = 0;
	tutorialTextAlphaTarget = 1;
	tutorialTextTimer = targetTimer;
}