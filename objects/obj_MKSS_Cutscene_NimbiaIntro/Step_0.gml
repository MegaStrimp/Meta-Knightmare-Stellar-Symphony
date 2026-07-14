///@description Main

/*
1
stop hud

2
dialogue1

3
dialogue2

4
music fadeout
dialogue3

5
warning

6
fly from left to right

7
fly towards mk

8
vertical moving cloud

9
spawn nimbia

10
bosstitle

11
end
*/

if (!localPause)
{
	#region Pause
	if (input_check_pressed("start",playerNum))
	{
		global.MKSS_CutsceneIsPaused = true;
	}
	#endregion
	
	#region Dialogue End Check
	if ((phaseTimer == -1) and (!instance_exists(obj_MKSS_UI_Dialogue)))
	{
		switch (phase)
		{
			case 2:
			case 3:
			case 4:
			phaseTimer = 60;
			break;
		}
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
				
				phaseTimer = 60;
				break;
				
				case 1:
				scr_MKSS_Dialogue_Create(global.MKSS_DialogueIDs[? "nimbia_PreBoss_1"],,,false,false,false);
				
				phaseTimer = -1;
				break;
				
				case 2:
				scr_MKSS_Dialogue_Create(global.MKSS_DialogueIDs[? "nimbia_PreBoss_2"],,,false,false,false);
				
				phaseTimer = -1;
				break;
				
				case 3:
				scr_MKSS_Dialogue_Create(global.MKSS_DialogueIDs[? "nimbia_PreBoss_3"],,,false,false,false);
				
				phaseTimer = -1;
				break;
				
				case 4:
				audio_stop_sound(global.musicPlaying);
				scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "boss"]);
				instance_create_depth(0,0,0,obj_MKSS_UI_Warning);
				
				phaseTimer = 290;
				break;
				
				case 5:
				phaseTimer = 200;
				break;
				
				case 6:
				phaseTimer = 200;
				break;
				
				case 7:
				phaseTimer = 200;
				break;
				
				case 8:
				with (instance_create_layer(room_width + 88,152,"Enemies",obj_MKSS_Enemy_Nimbia))
				{
					scr_MKSS_Enemy_Nimbia_AI_Normal_Setup();
					
					dirX = -1;
					image_xscale = dirX;
					
					scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Nimbia_AI_Normal_Intro_Step);
					sprite_index = spriteSet.sprIdle;
				}
				
				bossSpawned = true;
				
				phaseTimer = 200;
				break;
				
				case 9:
				var bossTitle = instance_create_depth(0,0,0,obj_MKSS_UI_BossTitle);
				with (bossTitle)
				{
					text = "[#" + MKSS_Base_Color_NimbiaTitle + "]Nimbia[/color]";
					subtext = "[#" + MKSS_Base_Color_NimbiaSubitle + "]Nimbus Warden[/color]";
					destroyTimer = 120;
				}
				
				phaseTimer = 120;
				break;
				
				case 10:
				global.hasHud = true;
				global.canGamePause = true;
				global.MKSS_CutsceneStopMovement = false;
				
				if (!bossSpawned)
				{
					bossSpawned = true;
				}
				
				with (obj_Particle) instance_destroy();
				
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
		
		phase = 4;
		phaseTimer = 0;
	}
	#endregion
}