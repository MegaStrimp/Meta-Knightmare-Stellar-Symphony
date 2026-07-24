///@description Main

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
				scr_Music_SetFade(0);
				
				with (instance_create_layer(256,152,"Enemies",obj_MKSS_Enemy_Nimbia))
				{
					scr_MKSS_Enemy_Nimbia_AI_Normal_Setup();
					
					dirX = -1;
					image_xscale = dirX;
					
					scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Nimbia_AI_Normal_Intro_Step);
					sprite_index = spriteSet.sprIdle;
				}
				
				bossSpawned = true;
				
				scr_MKSS_Dialogue_Create(global.MKSS_DialogueIDs[? "andromeda_PreBoss_1"],,,false,false,false);
				
				phaseTimer = -1;
				break;
				
				case 2:
				audio_stop_sound(global.musicPlaying);
				scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "andromedaBattle_1"]);
				scr_Music_SetFade(1,,1);
				
				musicPlayed = true;
				
				instance_create_depth(0,0,0,obj_MKSS_UI_Warning);
				
				phaseTimer = 360;
				break;
				
				case 3:
				var bossTitle = instance_create_depth(0,0,0,obj_MKSS_UI_BossTitle);
				with (bossTitle)
				{
					image = spr_MKSS_UI_BossTitle_Image_Andromeda;
					destroyTimer = 175;
				}
				
				phaseTimer = 175;
				break;
				
				case 4:
				global.hasHud = true;
				global.canGamePause = true;
				global.MKSS_CutsceneStopMovement = false;
				
				with (obj_MKSS_UI_BossTitle) instance_destroy();
				
				if (!musicPlayed)
				{
					scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "andromedaBattle_1"]);
					scr_Music_SetFade(1,,1);
					
					musicPlayed = true;
				}
				
				if (!bossSpawned)
				{
					with (instance_create_layer(256,152,"Enemies",obj_MKSS_Enemy_Nimbia))
					{
						dirX = -1;
						image_xscale = dirX;
						
						scr_MKSS_Enemy_Nimbia_AI_Normal_Setup();
					}
					
					bossSpawned = true;
				}
				
				with (obj_MKSS_Enemy_Nimbia)
				{
					scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
					sprite_index = spriteSet.sprIdle;
				}
				
				with (obj_MKSS_UI_Dialogue) instance_destroy();
				
				with (obj_MKSS_UI_Warning) instance_destroy();
				
				with (obj_MKSS_UI_BossTitle) instance_destroy();
				
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