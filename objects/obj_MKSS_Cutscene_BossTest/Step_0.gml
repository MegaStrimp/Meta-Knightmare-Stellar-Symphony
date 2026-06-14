///@description Main

if (phase == 2) time += 1;
if (!localPause)
{
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
				
				audio_stop_sound(global.musicPlaying);
				scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "boss"]);
				instance_create_depth(0,0,0,obj_MKSS_UI_Warning);
				
				phaseTimer = 290;
				break;
				
				case 1:
				phaseTimer = 800;
				break;
				
				case 2:
				var bossTitle = instance_create_depth(0,0,0,obj_MKSS_UI_BossTitle);
				with (bossTitle)
				{
					text = "[#EBC39B]Chasse-Emee[/color]";
					subtext = "[#A93233]Cruise Crustacean[/color]";
					destroyTimer = 120;
				}
				
				phaseTimer = 120;
				break;
				
				case 3:
				global.hasHud = true;
				global.canGamePause = true;
				
				instance_destroy();
				
				phaseTimer = -1;
				break;
			}
			
			phase += 1;
		}
	}
	#endregion
}