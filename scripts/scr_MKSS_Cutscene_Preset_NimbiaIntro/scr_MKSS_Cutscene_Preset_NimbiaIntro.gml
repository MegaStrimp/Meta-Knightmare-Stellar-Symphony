///@description MKSS - Cutscene - Preset - Nimbia Intro

function scr_MKSS_Cutscene_Preset_NimbiaIntro()
{
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
	
	#region Setup
	bossSpawned = false;
	musicPlayed = false;
	
	cameraXOffset = global.camera.xOffset;
	cameraYOffset = global.camera.yOffset;
	
	with (instance_create_depth(0,0,0,obj_MKSS_CameraOffsetController))
	{
		xOffset = other.cameraXOffset
		yOffset = other.cameraYOffset
	}

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
			scr_MKSS_Dialogue_Create(global.MKSS_DialogueIDs[? "nimbia_PreBoss_1"],,,false,false,false,depth + 1);
			
			phaseTimer = -1;
		},
		function()
		{
			scr_MKSS_Dialogue_Create(global.MKSS_DialogueIDs[? "nimbia_PreBoss_2"],,,false,false,false,depth + 1);
			
			phaseTimer = -1;
		},
		function()
		{
			scr_MKSS_Dialogue_Create(global.MKSS_DialogueIDs[? "nimbia_PreBoss_3"],,,false,false,false,depth + 1);
			
			phaseTimer = -1;
		},
		function()
		{
			audio_stop_sound(global.musicPlaying);
			scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "boss"]);
			
			musicPlayed = true;
			
			instance_create_depth(0,0,0,obj_MKSS_UI_Warning);
			
			phaseTimer = 290;
		},
		function()
		{
			phaseTimer = 200;
			with (instance_create_depth(-32,76,depth-1,obj_MKSS_Cutscene_NimbiaCloud))
			{
				moveTime = other.phaseTimer
				targetY = 152
				hsp = 5
				vsp = 0
			}
		},
		function()
		{
			phaseTimer = 200;
			with (obj_MKSS_Cutscene_NimbiaCloud)
			{
				advanceProgress()
				x = room_width + 32
				y = obj_MKSS_Player.y
				hsp = -12
				vsp = 0
			}
		},
		function()
		{
			phaseTimer = 200;
			with (obj_MKSS_Cutscene_NimbiaCloud)
			{
				x = 256
				y = -50
				hsp = 0
				vsp = 2
				advanceProgress()
			}
			with (obj_MKSS_CameraOffsetController)
			{
				targetXOffset = 50
			}
		},
		function()
		{
			with (obj_MKSS_Cutscene_NimbiaCloud) instance_destroy();
			with (instance_create_layer(256,152,"Enemies",obj_MKSS_Enemy_Nimbia))
			{
				scr_MKSS_Enemy_Nimbia_AI_Normal_Setup();
				
				dirX = -1;
				image_xscale = dirX;
				
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Nimbia_AI_Normal_Intro_Step);
				sprite_index = spriteSet.sprIdle;
			}
			
			bossSpawned = true;
			
			phaseTimer = 200;
			
			with (obj_Player)
			{
				attackMakeHeavyInvincibleTimer = 15;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
			}
		},
		function()
		{
			var bossTitle = instance_create_depth(0,0,0,obj_MKSS_UI_BossTitle);
			with (bossTitle)
			{
				text = "[" + MKSS_Base_Color_NimbiaTitle + "]Nimbia[/color]";
				subtext = "[" + MKSS_Base_Color_NimbiaSubitle + "]Nimbus Warden[/color]";
				destroyTimer = 120;
			}
			
			phaseTimer = 120;
		},
		function()
		{
			global.hasHud = true;
			global.canGamePause = true;
			global.MKSS_CutsceneStopMovement = false;
			
			if (!musicPlayed)
			{
				scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "boss"]);
				
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
			
			with (obj_MKSS_CameraOffsetController) instance_destroy()
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}