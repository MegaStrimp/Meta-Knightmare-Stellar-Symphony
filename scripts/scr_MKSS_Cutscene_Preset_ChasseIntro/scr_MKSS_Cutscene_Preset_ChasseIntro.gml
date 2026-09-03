///@description MKSS - Cutscene - Preset - Chasse Intro

function scr_MKSS_Cutscene_Preset_ChasseIntro()
{
	#region Setup
	bossSpawned = false;
	musicPlayed = false;
	#endregion
	
	#region Phase Setup Scripts
	phaseSetupScript = 
	[
		function()
		{
			global.hasHud = false;
			global.canGamePause = false;
			global.MKSS_CutsceneStopMovement = true;
			
			audio_stop_sound(global.musicPlaying);
			scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "boss"]);
			instance_create_depth(0,0,0,obj_MKSS_UI_Warning);
			
			with (obj_Player)
			{
				attackMakeHeavyInvincible = true;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_ChasseEmee_Step);
			}
			
			phaseTimer = 290;
		},
		function()
		{
			instance_create_depth(camera_get_view_x(mainView) + (global.gameWidth / 2),camera_get_view_y(mainView) + (global.gameHeight / 2),layer_get_depth("BackgroundEnvironment") + 2,obj_MKSS_BgEnv_ChasseShip);
			
			phaseTimer = 60;
		},
		function()
		{
			with (obj_Player)
			{
				scr_ChangeSprite(spriteSet.sprFront);
				
				lookingForward = true;
			}
			
			phaseTimer = 200;
		},
		function()
		{
			with (obj_Player)
			{
				#region Audio
				var sfx = scr_PlaySfx(snd_MKSS_Slide);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				#endregion
				
				#region Particles
				scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
				#endregion
				
				dirX = -1;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_ChasseEmee_Slide_Step);
			}
			
			phaseTimer = 40;
		},
		function()
		{
			with (obj_Player)
			{
				#region Audio
				var sfx = scr_PlaySfx(snd_MKSS_Slide);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				#endregion
				
				#region Particles
				scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
				#endregion
				
				dirX = 1;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_ChasseEmee_Slide_Step);
			}
			
			phaseTimer = 300;
		},
		function()
		{
			with (instance_create_layer(room_width + 88,152,"Enemies",obj_MKSS_Enemy_ChasseEmee))
			{
				scr_MKSS_Enemy_ChasseEmee_AI_Normal_Setup();
				
				dirX = -1;
				image_xscale = dirX;
				
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_ChasseEmee_AI_Normal_Intro_Step);
				sprite_index = spriteSet.sprIntro;
			}
			
			bossSpawned = true;
			
			with (obj_MKSS_BgEnv_ChasseShip) instance_destroy();
			
			phaseTimer = 30;
		},
		function()
		{
			with (obj_Player)
			{
				#region Audio
				var sfx = scr_PlaySfx(snd_MKSS_RunBegin);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				#endregion
				
				#region Particles
				scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
				#endregion
				
				hsp = movespeedSlide * -1 * speedMultFinal;
				dirX = 1;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_ChasseEmee_Dodge_Step);
			}
			
			phaseTimer = 170;
		},
		function()
		{
			var bossTitle = instance_create_depth(0,0,0,obj_MKSS_UI_BossTitle);
			with (bossTitle)
			{
				text = "[" + MKSS_Base_Color_ChasseEmeeTitle + "]Chasse-Emee[/color]";
				subtext = "[" + MKSS_Base_Color_ChasseEmeeSubitle + "]Cruise Crustacean[/color]";
				destroyTimer = 120;
			}
			
			phaseTimer = 120;
		},
		function()
		{
			global.hasHud = true;
			global.canGamePause = true;
			global.MKSS_CutsceneStopMovement = false;
			
			if (!bossSpawned)
			{
				with (instance_create_layer(room_width + 88,152,"Enemies",obj_MKSS_Enemy_ChasseEmee))
				{
					scr_MKSS_Enemy_ChasseEmee_AI_Normal_Setup();
				}
				
				bossSpawned = true;
			}
			
			with (obj_Player)
			{
				attackMakeHeavyInvincibleTimer = 15;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
			}
			
			with (obj_MKSS_BgEnv_ChasseShip) instance_destroy();
			
			with (obj_Particle) instance_destroy();
			
			with (obj_MKSS_Enemy_ChasseEmee)
			{
				x = 448;
				y = 152;
				
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
				
				sprite_index = spriteSet.sprIdle;
				
				dirX = -1;
				image_xscale = dirX;
			}
			
			with (obj_MKSS_UI_Warning) instance_destroy();
			
			with (obj_MKSS_UI_BossTitle) instance_destroy();
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}