///@description Main

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
				global.MKSS_CutsceneStopMovement = true;
				
				audio_stop_sound(global.musicPlaying);
				scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "boss"]);
				instance_create_depth(0,0,0,obj_MKSS_UI_Warning);
				
				phaseTimer = 290;
				break;
				
				case 1:
				instance_create_depth(camera_get_view_x(mainView) + (global.gameWidth / 2),camera_get_view_y(mainView) + (global.gameHeight / 2),layer_get_depth("BackgroundEnvironment") + 2,obj_MKSS_ChasseShip);
				
				phaseTimer = 600;
				break;
				
				case 2:
				with (instance_create_layer(room_width + 88,152,"Enemies",obj_MKSS_Enemy_ChasseEmee))
				{
					scr_MKSS_Enemy_ChasseEmee_AI_Normal_Setup();
					
					dirX = -1;
					image_xscale = dirX;
					
					scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_ChasseEmee_AI_Normal_Intro_Step);
					sprite_index = spriteSet.sprIntro;
				}
				
				with (obj_MKSS_ChasseShip) instance_destroy();
				
				phaseTimer = 200;
				break;
				
				case 3:
				var bossTitle = instance_create_depth(0,0,0,obj_MKSS_UI_BossTitle);
				with (bossTitle)
				{
					text = "[#EBC39B]Chasse-Emee[/color]";
					subtext = "[#A93233]Cruise Crustacean[/color]";
					destroyTimer = 120;
				}
				
				phaseTimer = 120;
				break;
				
				case 4:
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