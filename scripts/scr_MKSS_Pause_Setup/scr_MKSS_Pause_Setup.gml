///@description MKSS - Pause - Setup

function scr_MKSS_Pause_Setup()
{
	#region Game Pause Variables
	MKSS_GamePause_Locked = false;
	MKSS_GamePause_OverlayAlpha = 0;
	
	MKSS_GamePause_TitleXTarget = -70;
	MKSS_GamePause_TitleX = MKSS_GamePause_TitleXTarget;
	
	MKSS_GamePause_DecalPalette = -1;
	
	MKSS_GamePause_DecalLengthTarget = -50;
	MKSS_GamePause_DecalLength = MKSS_GamePause_DecalLengthTarget;
	
	MKSS_GamePause_DecalStarTimer = -1;
	MKSS_GamePause_DecalStarTimerMax = 10;
	
	MKSS_GamePause_EndTimer = -1;
	MKSS_GamePause_EndTimerMax = 30;
	
	MKSS_GamePause_PauseButtonAlphaTarget = 1;
	MKSS_GamePause_PauseButtonAlpha = MKSS_GamePause_PauseButtonAlphaTarget;
	
	MKSS_GamePause_UpgradesAlphaTarget = 1;
	MKSS_GamePause_UpgradesAlpha = MKSS_GamePause_UpgradesAlphaTarget;
	
	MKSS_GamePause_Upgrades_ButtonYTarget = -40;
	MKSS_GamePause_Upgrades_ButtonY = MKSS_GamePause_Upgrades_ButtonYTarget;
	MKSS_GamePause_Upgrades_ButtonIndex = 0;
	MKSS_GamePause_Upgrades_ButtonIndexMax = sprite_get_number(spr_MKSS_Menu_PauseScreen_UpgradesButton);
	MKSS_GamePause_Upgrades_ButtonSpd = sprite_get_speed(spr_MKSS_Menu_PauseScreen_UpgradesButton) / 60;
	
	MKSS_GamePause_CircleSurface = -1;
	MKSS_GamePause_CircleSurfaceOutline = -1;
	MKSS_GamePause_CircleSurface_PixelH = shader_get_uniform(shd_ColoredOutline,"pixelH");
	MKSS_GamePause_CircleSurface_PixelW = shader_get_uniform(shd_ColoredOutline,"pixelW");
	MKSS_GamePause_CircleSurface_OutlineColor = shader_get_uniform(shd_ColoredOutline,"outlineColor");
	MKSS_GamePause_CircleCount = 8;
	MKSS_GamePause_CircleBg = spr_MKSS_Menu_PauseScreen_Upgrades_Bg;
	MKSS_GamePause_CircleBgWidth = sprite_get_width(MKSS_GamePause_CircleBg);
	MKSS_GamePause_CircleBgHeight = sprite_get_height(MKSS_GamePause_CircleBg);
	MKSS_GamePause_CircleBgX = 0;
	MKSS_GamePause_CircleBgY = 0;
	MKSS_GamePause_CircleBgStars1 = spr_MKSS_Menu_PauseScreen_Upgrades_BgStars1;
	MKSS_GamePause_CircleBgStars1Width = sprite_get_width(MKSS_GamePause_CircleBgStars1);
	MKSS_GamePause_CircleBgStars1Height = sprite_get_height(MKSS_GamePause_CircleBgStars1);
	MKSS_GamePause_CircleBgStars1X = 0;
	MKSS_GamePause_CircleBgStars1Y = 0;
	MKSS_GamePause_CircleBgStars2 = spr_MKSS_Menu_PauseScreen_Upgrades_BgStars2;
	MKSS_GamePause_CircleBgStars2Width = sprite_get_width(MKSS_GamePause_CircleBgStars2);
	MKSS_GamePause_CircleBgStars2Height = sprite_get_height(MKSS_GamePause_CircleBgStars2);
	MKSS_GamePause_CircleBgStars2X = 0;
	MKSS_GamePause_CircleBgStars2Y = 0;
	MKSS_GamePause_CircleZoom = 1;
	MKSS_GamePause_CircleZoomTarget = 1;
	
	for (var i = 0; i < MKSS_GamePause_CircleCount; i++)
	{
		MKSS_GamePause_CircleAngle[i] = (360 / MKSS_GamePause_CircleCount) * i;
		MKSS_GamePause_CirclePer[i] = irandom_range(2,6);
		MKSS_GamePause_CircleAmp[i] = irandom_range(1,3);
		MKSS_GamePause_CircleRad[i] = irandom_range(8,14);
		MKSS_GamePause_CircleDir[i] = choose(-1,1);
	}
	
	MKSS_GamePause_SettingsActive = false;
	
	MKSS_GamePause_SettingsButtonYTarget = -40;
	MKSS_GamePause_SettingsButtonY = MKSS_GamePause_SettingsButtonYTarget;
	MKSS_GamePause_SettingsButtonIndex = 0;
	MKSS_GamePause_SettingsButtonIndexMax = sprite_get_number(spr_MKSS_Menu_PauseScreen_SettingsButton);
	MKSS_GamePause_SettingsButtonSpd = sprite_get_speed(spr_MKSS_Menu_PauseScreen_SettingsButton) / 60;
	
	MKSS_GamePause_Settings_BackgroundY = 0;
	MKSS_GamePause_Settings_BackgroundVsp = .25;
	
	MKSS_GamePause_Settings_TransitionX = -150;
	MKSS_GamePause_Settings_TransitionXTarget = -150;
	
	var count = 0;
	for (var i = 0; i < 5; i++)
	{
		for (var j = 0; j < 7; j++)
		{
			MKSS_GamePause_Settings_Cog[count] =
			{
				x: 0,
				y: 0,
				appearTimer: -1,
				disappearTimer: -1
			}
			count += 1;
		}
	}
	
	MKSS_GamePause_ExitButtonYTarget = -40;
	MKSS_GamePause_ExitButtonY = MKSS_GamePause_ExitButtonYTarget;
	MKSS_GamePause_ExitButtonIndex = 0;
	MKSS_GamePause_ExitButtonIndexMax = sprite_get_number(spr_MKSS_Menu_PauseScreen_ExitButton);
	MKSS_GamePause_ExitButtonSpd = sprite_get_speed(spr_MKSS_Menu_PauseScreen_ExitButton) / 60;
	
	MKSS_GamePause_ReturnButtonYTarget = -40;
	MKSS_GamePause_ReturnButtonY = MKSS_GamePause_ReturnButtonYTarget;
	MKSS_GamePause_ReturnButtonIndex = 0;
	MKSS_GamePause_ReturnButtonIndexMax = sprite_get_number(spr_MKSS_Menu_PauseScreen_ReturnButton);
	MKSS_GamePause_ReturnButtonSpd = sprite_get_speed(spr_MKSS_Menu_PauseScreen_ReturnButton) / 60;
	
	gamePauseAIExecute = scr_MKSS_Pause_Execute;
	gamePauseAIStep = scr_MKSS_Pause_Step;
	gamePauseAIDrawEnd = scr_MKSS_Pause_DrawEnd;
	gamePauseAIClean = scr_MKSS_Pause_Clean;
	#endregion
}