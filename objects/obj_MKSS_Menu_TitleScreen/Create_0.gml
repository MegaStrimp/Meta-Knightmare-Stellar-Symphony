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

miscButtonY = 170;

titleSwordStarsTimer = 15;

currentButtonText = "";

currentSelectedSave = "Save1.ini";

for (var i = 0; i < 3; i++)
{
	var fileName = "Save" + string(i + 1) + ".ini";
	
	var fileFinal = fileName;
	if (!global.isMobile) fileFinal = environment_get_variable("LOCALAPPDATA") + chr(92) + global.gameTitle + chr(92) + fileName;
	
	saveExists[i] = file_exists(fileFinal);
}
#endregion

#region Logo Attributes
particleTimerMax = 30;
particleTimer = particleTimerMax;
#endregion