///@description Create

#region Menu Attributes
playerNum = 0;

state = 0;
stateTimer = 0;

blackAlpha = 1;

swordX = 40;
if (global.MKSS_DisclaimerScreen_Skipped)
{
	swordX = -300;
	global.MKSS_DisclaimerScreen_Skipped = false;
}
swordY = 51;
swordAngle = 0;
swordMaskAlpha = 1;

swordShineX = 300;
swordShineTimer = -1;

subtitleFrame = 0;
subtitleImageSpeed = sprite_get_speed(spr_MKSS_Menu_TitleScreen_Logo_Subtitle) / 60;

starAlpha = 0;

saveButtonX = 500;
deleteSaveState = 0;

miscButtonY = 170;

titleSwordStarsTimer = 15;

currentButtonText = "";

switch (global.lastSelectedSave)
{
	default:
	selection = mainMenu_Buttons.save1;
	break;
	
	case "Save2.ini":
	selection = mainMenu_Buttons.save2;
	break;
	
	case "Save3.ini":
	selection = mainMenu_Buttons.save3;
	break;
}

#region Main Menu Buttons
enum mainMenu_Buttons
{
	save1,
	save2,
	save3,
	discord,
	twitter,
	github,
	leave
}
#endregion
#endregion

#region Logo Attributes
particleTimerMax = 30;
particleTimer = particleTimerMax;
#endregion