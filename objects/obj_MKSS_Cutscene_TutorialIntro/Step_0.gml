///@description Main

if (!localPause)
{
	#region Pause
	if ((input_check_pressed("start",playerNum)) and (global.debug))
	{
		global.MKSS_CutsceneIsPaused = true;
	}
	#endregion
	
	#region Overlay
	overlayAlpha = lerp(overlayAlpha,phase < 2,.02);
	#endregion
	#endregion
	
	#region Camera
	if (phase > 4)
	{
		cameraOffset = min(cameraOffsetOld,cameraOffset + 1);
	}
	#endregion
	
	#region Phase Timer
	if (phaseTimer != -1)
	{
		phaseTimer = max(phaseTimer - speedMultFinal,0);
		if (phaseTimer == 0)
		{
			switch (phase)
			{
				case 0:
				global.hasHud = false;
				global.canGamePause = false;
				global.MKSS_CutsceneStopMovement = true;
				with (obj_Player) clampToView = false;
				with (obj_MKSS_OceanAmbience) instance_destroy();
				
				audio_stop_sound(global.musicPlaying);
				
				phaseTimer = 120;
				break;
				
				case 1:
				instance_create_depth(0,0,0,obj_MKSS_OceanAmbience);
				
				phaseTimer = 150;
				break;
				
				case 2:
				scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "iceCreamIsland"]);
				
				musicPlayed = true;
				
				with (instance_create_layer(0,0,"Instances",obj_MKSS_UI_FadingText))
				{
					text = "Made by Strimp's Kitchen";
					disappearTimer = 240;
					xOffset = global.gameWidth / 2;
					yOffset = global.gameHeight / 2;
					halign = fa_center;
					valign = fa_middle;
				}
				
				phaseTimer = 360;
				break;
				
				case 3:
				with (instance_create_layer(0,0,"Instances",obj_MKSS_UI_FadingText))
				{
					text = "Meta Knightmare Stellar Symphony";
					disappearTimer = 240;
					xOffset = global.gameWidth / 2;
					yOffset = global.gameHeight / 2;
					halign = fa_center;
					valign = fa_middle;
				}
				
				phaseTimer = 120;
				break;
				
				case 4:
				phaseTimer = 240;
				break;
				
				case 5:
				global.hasHud = true;
				global.canGamePause = true;
				global.MKSS_CutsceneStopMovement = false;
				
				if (!musicPlayed)
				{
					scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "iceCreamIsland"]);
					
					musicPlayed = true;
				}
				
				cameraOffset = cameraOffsetOld;
				
				with (obj_Player)
				{
					clampToView = false;
					
					scr_MKSS_Player_SetTutorialText("[leftIcon][rightIcon] Walk",300);
				}
				
				if (!instance_exists(obj_MKSS_OceanAmbience)) instance_create_depth(0,0,0,obj_MKSS_OceanAmbience);
				
				instance_destroy();
				
				phaseTimer = -1;
				break;
			}
			
			phase += 1;
		}
	}
	#endregion
}
else
{
	#region Resume
	if (input_check_pressed("start",playerNum))
	{
		global.MKSS_CutsceneIsPaused = false;
	}
	#endregion
	
	#region Skip
	if (input_check_pressed("select",playerNum))
	{
		global.MKSS_CutsceneIsPaused = false;
		
		phase = 5;
		phaseTimer = 0;
	}
	#endregion
}

#region Update Environments & Camera
with (obj_MKSS_CameraOffsetController) targetYOffset = other.cameraOffset;
#endregion