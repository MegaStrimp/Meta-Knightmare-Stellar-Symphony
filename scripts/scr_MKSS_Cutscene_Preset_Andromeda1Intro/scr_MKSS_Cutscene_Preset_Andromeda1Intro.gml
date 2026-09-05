///@description MKSS - Cutscene - Preset - Andromeda 1 Intro

function scr_MKSS_Cutscene_Preset_Andromeda1Intro()
{
	#region Setup
	bossSpawned = false;
	musicPlayed = false;
	#endregion
	
	#region Step Script
	stepScript = function()
	{
		if (!localPause)
		{
			#region Dialogue End Check
			if ((phaseTimer == -1) and (!instance_exists(obj_MKSS_UI_Dialogue)))
			{
				phaseTimer = 60;
			}
			#endregion
		}
	};
	#endregion
	
	#region Phase Setup Scripts
	phaseSetupScript = 
	[
		function()
		{
			global.hasHud = false;
			global.canGamePause = false;
			global.MKSS_CutsceneStopMovement = true;
			
			phaseTimer = 60;
		},
		function()
		{
			scr_Music_SetFade(0);
			
			with (instance_create_layer(256,152,"Enemies",obj_MKSS_Enemy_Andromeda1))
			{
				scr_MKSS_Enemy_Andromeda1_AI_Normal_Setup();
				
				dirX = -1;
				image_xscale = dirX;
				
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Andromeda1_AI_Normal_Idle_Step);
				sprite_index = spriteSet.sprIdle;
			}
			
			bossSpawned = true;
			
			scr_MKSS_Dialogue_Create(global.MKSS_DialogueIDs[? "andromeda_PreBoss_1"],,,false,false,false,depth + 1);
			
			phaseTimer = -1;
		},
		function()
		{
			audio_stop_sound(global.musicPlaying);
			scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "andromedaBattle_1"]);
			scr_Music_SetFade(1,,1);
			
			musicPlayed = true;
			
			instance_create_depth(0,0,0,obj_MKSS_UI_Warning);
			
			phaseTimer = 360;
		},
		function()
		{
			var bossTitle = instance_create_depth(0,0,0,obj_MKSS_UI_BossTitle);
			with (bossTitle)
			{
				image = spr_MKSS_UI_BossTitle_Image_Andromeda;
				destroyTimer = 175;
			}
			
			phaseTimer = 175;
		},
		function()
		{
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
				with (instance_create_layer(256,152,"Enemies",obj_MKSS_Enemy_Andromeda1))
				{
					dirX = -1;
					image_xscale = dirX;
					
					scr_MKSS_Enemy_Andromeda1_AI_Normal_Setup();
				}
				
				bossSpawned = true;
			}
			
			with (obj_MKSS_Enemy_Andromeda1)
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
		}
	];
	#endregion
}