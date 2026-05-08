///@description Main

if (!localPause)
{
	#region Pause
	if (input_check_pressed("start",playerNum))
	{
		global.MKSS_CutsceneIsPaused = true;
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
				
				audio_stop_sound(global.musicPlaying);
				
				phaseTimer = 210;
				break;
				
				case 666:
				var bossTitle = instance_create_depth(0,0,0,obj_MKSS_UI_BossTitle);
				with (bossTitle)
				{
					text = "[#74B8FF]Starless Nightmare[/color]";
					subtext = "[#235297]King of Astral Dreams[/color]";
					destroyTimer = 180;
				}
				
				phaseTimer = 180;
				break;
				
				case 777:
				global.hasHud = true;
				global.canGamePause = true;
				global.MKSS_CutsceneStopMovement = false;
				
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
		
		phase = 9;
		phaseTimer = 0;
	}
	#endregion
}