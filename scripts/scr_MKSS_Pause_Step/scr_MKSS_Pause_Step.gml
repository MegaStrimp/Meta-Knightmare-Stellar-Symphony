///@description MKSS - Pause - Step

function scr_MKSS_Pause_Step()
{
	#region Variables
	global.hasHud = false;
	
	var xx = camera_get_view_x(mainView);
	var yy = camera_get_view_y(mainView);
	
	var canSelect = ((MKSS_GamePause_EndTimer == -1) and (!instance_exists(obj_Transition)) and (!MKSS_GamePause_Locked));
	#endregion
	
	if (canSelect)
	{
		#region Selection
		if ((gamePauseDelayTimer == -1) and (gamePauseEndTimer == -1))
		{
			if ((input_check_pressed("A",playerNum)) or (input_check_pressed("start",playerNum)) or ((scr_MouseIsInbetween(xx + 75,yy + 115,xx + 166,yy + 155)) and (mouse_check_button_pressed(mb_left))))
			{
				scr_PlaySfx(snd_MKSS_Unpause);
				
				MKSS_GamePause_TitleXTarget = -70;
				
				MKSS_GamePause_DecalLengthTarget = -50;
				MKSS_GamePause_Upgrades_ButtonYTarget = -40;
				MKSS_GamePause_SettingsButtonYTarget = -40;
				MKSS_GamePause_ExitButtonYTarget = -40;
				MKSS_GamePause_ReturnButtonYTarget = -40;
				
				MKSS_GamePause_DecalStarTimer = -1;
				
				MKSS_GamePause_EndTimer = 30;
			}
			else if ((input_check_pressed("B",playerNum)) or ((scr_MouseIsInbetween(xx + 163,yy + 63,xx + 217,yy + 116)) and (mouse_check_button_pressed(mb_left))))
			{
				scr_PlaySfx(snd_MKSS_ButtonNo);
				
				var targetRoom = rm_MKSS_BattleshipHalberd;
				if (!global.inStage) targetRoom = rm_MKSS_Menu_TitleScreen;
				scr_GoToRoom(targetRoom,false);
				
				scr_MKSS_Stage_End();
				
				MKSS_GamePause_TitleXTarget = -70;
				
				MKSS_GamePause_DecalLengthTarget = -50;
				MKSS_GamePause_Upgrades_ButtonYTarget = -40;
				MKSS_GamePause_SettingsButtonYTarget = -40;
				MKSS_GamePause_ExitButtonYTarget = -40;
				MKSS_GamePause_ReturnButtonYTarget = -40;
				
				MKSS_GamePause_DecalStarTimer = -1;
				
				MKSS_GamePause_EndTimer = 30;
			}
			else if ((input_check_pressed("X",playerNum)) or ((scr_MouseIsInbetween(xx + 17,yy + 61,xx + 94,yy + 130)) and (mouse_check_button_pressed(mb_left))))
			{
				instance_create_depth(0,0,depth - 1,obj_MKSS_Menu_Settings);
				
				MKSS_GamePause_Locked = true;
				
				gamePauseDelayTimer = gamePauseDelayTimerMax;
				MKSS_GamePause_PauseButtonAlphaTarget = 0;
				MKSS_GamePause_UpgradesAlphaTarget = 0;
				
				MKSS_GamePause_SettingsActive = true;
				MKSS_GamePause_Settings_TransitionXTarget = 260;
				
				var count = 0;
				for (var i = 0; i < 5; i++)
				{
					for (var j = 0; j < 7; j++)
					{
						MKSS_GamePause_Settings_Cog[count] =
						{
							x: 20 + lengthdir_x(50 * i,240) + lengthdir_x(50 * j,340),
							y: -60 + lengthdir_y(50 * i,240) + lengthdir_y(50 * j,340),
							appearTimer: max(0,j - 1) * 5,
							disappearTimer: max(0,j - 1) * 5 + 35
						}
						count += 1;
					}
				}
			}
			else if ((input_check_pressed("Y",playerNum)) or ((scr_MouseIsInbetween(xx + 87,yy,xx + 158,yy + 65)) and (mouse_check_button_pressed(mb_left))))
			{
				instance_create_depth(0,0,depth - 1,obj_MKSS_Menu_Upgrades);
				
				MKSS_GamePause_Locked = true;
				
				MKSS_GamePause_PauseButtonAlphaTarget = 0;
				
				MKSS_GamePause_CircleZoomTarget = 20;
			}
		}
		
		#region Decal Star Timer
		if (MKSS_GamePause_DecalStarTimer != -1)
		{
			MKSS_GamePause_DecalStarTimer = max(MKSS_GamePause_DecalStarTimer - speedMultFinal,0);
			if (MKSS_GamePause_DecalStarTimer == 0)
			{
				var parLength = irandom_range(0,160);
				scr_MKSS_ParticleSet_PauseStars(90 + lengthdir_x(parLength,125),170 + lengthdir_x(parLength,125),45);
				
				MKSS_GamePause_DecalStarTimer = MKSS_GamePause_DecalStarTimerMax;
			}
		}
		#endregion
	}
	#endregion
	
	#region Overlay
	MKSS_GamePause_OverlayAlpha = lerp(MKSS_GamePause_OverlayAlpha,(.5 * global.gamePause),.2);
	#endregion
	
	#region Title
	MKSS_GamePause_TitleX = lerp(MKSS_GamePause_TitleX,MKSS_GamePause_TitleXTarget,.07);
	#endregion
	
	#region Decals
	MKSS_GamePause_DecalLength = lerp(MKSS_GamePause_DecalLength,MKSS_GamePause_DecalLengthTarget,.1);
	#endregion
	
	#region Buttons
	var lerpSpd = .1;
	//if (MKSS_GamePause_Page == MKSS_PausePages.upgrades) lerpSpd = .2;
	
	MKSS_GamePause_PauseButtonAlpha = lerp(MKSS_GamePause_PauseButtonAlpha,MKSS_GamePause_PauseButtonAlphaTarget,lerpSpd);
	
	MKSS_GamePause_UpgradesAlpha = lerp(MKSS_GamePause_UpgradesAlpha,MKSS_GamePause_UpgradesAlphaTarget,lerpSpd);
	
	MKSS_GamePause_Upgrades_ButtonY = lerp(MKSS_GamePause_Upgrades_ButtonY,MKSS_GamePause_Upgrades_ButtonYTarget,.1);
	MKSS_GamePause_Upgrades_ButtonIndex += MKSS_GamePause_Upgrades_ButtonSpd;
	if (MKSS_GamePause_Upgrades_ButtonIndex >= MKSS_GamePause_Upgrades_ButtonIndexMax) MKSS_GamePause_Upgrades_ButtonIndex -= MKSS_GamePause_Upgrades_ButtonIndexMax;
	
	MKSS_GamePause_SettingsButtonY = lerp(MKSS_GamePause_SettingsButtonY,MKSS_GamePause_SettingsButtonYTarget,.1);
	MKSS_GamePause_SettingsButtonIndex += MKSS_GamePause_SettingsButtonSpd;
	if (MKSS_GamePause_SettingsButtonIndex >= MKSS_GamePause_SettingsButtonIndexMax) MKSS_GamePause_SettingsButtonIndex -= MKSS_GamePause_SettingsButtonIndexMax;
	
	MKSS_GamePause_ExitButtonY = lerp(MKSS_GamePause_ExitButtonY,MKSS_GamePause_ExitButtonYTarget,.1);
	MKSS_GamePause_ExitButtonIndex += MKSS_GamePause_ExitButtonSpd;
	if (MKSS_GamePause_ExitButtonIndex >= MKSS_GamePause_ExitButtonIndexMax) MKSS_GamePause_ExitButtonIndex -= MKSS_GamePause_ExitButtonIndexMax;
	
	MKSS_GamePause_ReturnButtonY = lerp(MKSS_GamePause_ReturnButtonY,MKSS_GamePause_ReturnButtonYTarget,.1);
	MKSS_GamePause_ReturnButtonIndex += MKSS_GamePause_ReturnButtonSpd;
	if (MKSS_GamePause_ReturnButtonIndex >= MKSS_GamePause_ReturnButtonIndexMax) MKSS_GamePause_ReturnButtonIndex -= MKSS_GamePause_ReturnButtonIndexMax;
	#endregion
	
	#region Upgrades Transition
	for (var i = 0; i < MKSS_GamePause_CircleCount; i++)
	{
		MKSS_GamePause_CircleAngle[i] += .5;
	}
	
	MKSS_GamePause_CircleZoom = lerp(MKSS_GamePause_CircleZoom,MKSS_GamePause_CircleZoomTarget,.1);
	
	MKSS_GamePause_CircleBgX += .2;
	if (MKSS_GamePause_CircleBgX >= MKSS_GamePause_CircleBgWidth) MKSS_GamePause_CircleBgX -= MKSS_GamePause_CircleBgWidth;
	MKSS_GamePause_CircleBgY += .075;
	if (MKSS_GamePause_CircleBgY >= MKSS_GamePause_CircleBgHeight) MKSS_GamePause_CircleBgY -= MKSS_GamePause_CircleBgHeight;
	MKSS_GamePause_CircleBgStars1X += .16;
	if (MKSS_GamePause_CircleBgStars1X >= MKSS_GamePause_CircleBgStars1Width) MKSS_GamePause_CircleBgStars1X -= MKSS_GamePause_CircleBgStars1Width;
	MKSS_GamePause_CircleBgStars1Y += .06;
	if (MKSS_GamePause_CircleBgStars1Y >= MKSS_GamePause_CircleBgStars1Height) MKSS_GamePause_CircleBgStars1Y -= MKSS_GamePause_CircleBgStars1Height;
	MKSS_GamePause_CircleBgStars2X += .12;
	if (MKSS_GamePause_CircleBgStars2X >= MKSS_GamePause_CircleBgStars2Width) MKSS_GamePause_CircleBgStars2X -= MKSS_GamePause_CircleBgStars2Width;
	MKSS_GamePause_CircleBgStars2Y += .04;
	if (MKSS_GamePause_CircleBgStars2Y >= MKSS_GamePause_CircleBgStars2Height) MKSS_GamePause_CircleBgStars2Y -= MKSS_GamePause_CircleBgStars2Height;
	#endregion
	
	#region Settings
	MKSS_GamePause_Settings_BackgroundY = (MKSS_GamePause_Settings_BackgroundY + MKSS_GamePause_Settings_BackgroundVsp) % 224;
	
	var lerpSpd = .1;
	if (MKSS_GamePause_SettingsActive)
	{
		lerpSpd = .2;
		
		for (var i = 0; i < array_length(MKSS_GamePause_Settings_Cog); i++)
		{
			if (MKSS_GamePause_Settings_Cog[i].appearTimer != -1)
			{
				MKSS_GamePause_Settings_Cog[i].appearTimer = max(MKSS_GamePause_Settings_Cog[i].appearTimer - speedMultFinal,0);
				if (MKSS_GamePause_Settings_Cog[i].appearTimer == 0)
				{
					scr_PlaySfx(snd_MKSS_SettingsCog);
					
					MKSS_GamePause_Settings_Cog[i].appearTimer = -1;
				}
			}
			
			if (MKSS_GamePause_Settings_Cog[i].disappearTimer != -1)
			{
				MKSS_GamePause_Settings_Cog[i].disappearTimer = max(MKSS_GamePause_Settings_Cog[i].disappearTimer - speedMultFinal,0);
				if (MKSS_GamePause_Settings_Cog[i].disappearTimer == 0)
				{
					scr_PlaySfx(snd_MKSS_SettingsCog);
					
					MKSS_GamePause_Settings_Cog[i].disappearTimer = -1;
				}
			}
		}
	}
	
	MKSS_GamePause_Settings_TransitionX = lerp(MKSS_GamePause_Settings_TransitionX,MKSS_GamePause_Settings_TransitionXTarget,lerpSpd);
	#endregion
	
	#region End Timer
	if (MKSS_GamePause_EndTimer != -1)
	{
		MKSS_GamePause_EndTimer = max(MKSS_GamePause_EndTimer - speedMultFinal,0);
		if (MKSS_GamePause_EndTimer == 0)
		{
			if (room != rm_MKSS_Menu_TitleScreen) global.hasHud = true;
			
			gamePauseEndTimer = 0;
			gamePauseDelayTimer = gamePauseDelayTimerMax + 5;
			
			MKSS_GamePause_EndTimer = -1;
		}
	}
	#endregion
}