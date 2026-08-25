///@description MKSS - Cutscene - Preset - Starless Marx Intro

function scr_MKSS_Cutscene_Preset_StarlessMarxIntro()
{
	#region Setup
	groundAlpha = 0;
	groundAlphaTarget = 0;
	skyAlpha = 0;
	skyAlphaTarget = 0;
	apparitionTimer = -1;
	apparitionTimerMax = 40;
	apparitionDir = 1;
	apparitionDirPrev = apparitionDir;
	apparitionY = 150;
	cameraOffset = 0;
	moveCamera = false;
	musicPlayed = false;
	marxSpawned = false;
	
	instance_create_depth(0,0,0,obj_MKSS_CameraOffsetController);
	#endregion
	
	#region Step Script
	stepScript = function()
	{
		#region Update Environments & Camera
		with (obj_MKSS_BgEnv_StarlessMarxArena_Ground)
		{
			alpha = other.groundAlpha;
			image_alpha = alpha;
		}
		
		with (obj_MKSS_BgEnv_StarlessMarxArena)
		{
			alpha = other.skyAlpha;
			image_alpha = alpha;
		}
		
		with (obj_MKSS_CameraOffsetController) targetYOffset = other.cameraOffset;
		#endregion
		
		if (!localPause)
		{
			#region Environment
			groundAlpha = lerp(groundAlpha,groundAlphaTarget,.05);
			skyAlpha = lerp(skyAlpha,skyAlphaTarget,.05);
			#endregion
			
			#region Camera
			if (moveCamera)
			{
				cameraOffset = max(cameraOffset - .25,-70);
			}
			#endregion
			
			#region Apparition Timer
			if (apparitionTimer != -1)
			{
				apparitionTimer = max(apparitionTimer - speedMultFinal,0);
				if (apparitionTimer == 0)
				{
					var xFinal = 0;
					var yFinal = apparitionY;
					
					apparitionDir = choose(-1,1,apparitionDirPrev,apparitionDirPrev);
					if (apparitionDir == 1)
					{
						xFinal = room_width;
						apparitionDir = -1;
					}
					else
					{
						xFinal = 0;
						apparitionDir = 1;
					}
					apparitionDirPrev = apparitionDir;
					
					var sfx = scr_PlaySfx(snd_MKSS_MarxRise);
					audio_sound_pitch(sfx,random_range(.85,1.15));
					var laughSfx = scr_PlaySfx(choose(snd_MKSS_MarxLaugh1,snd_MKSS_MarxLaugh2,snd_MKSS_MarxLaugh3,snd_MKSS_MarxLaugh4));
					audio_sound_pitch(laughSfx,random_range(.85,1.15));
					
					with (instance_create_layer(xFinal + (30 * -apparitionDir),yFinal,"Enemies",obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = true;
						dmg = 0;
						knockbackForce = 1;
						hsp = irandom_range(2,4) * other.apparitionDir;
						vsp = irandom_range(-2,0);
						sprite_index = global.MKSS_EnemyList[global.MKSS_EnemyIDs[? "starlessMarx"]].spriteSet.sprFly;
						mask_index = sprite_index;
						image_xscale = other.apparitionDir;
						dirX = other.apparitionDir;
						attackAIStep = scr_MKSS_Attack_StarlessMarx_FlyingApparition_Step;
						attackDrawSelf = scr_MKSS_Attack_StarlessMarx_FlyingApparition_DrawSelf;
					}
					
					apparitionY -= 15;
					apparitionTimerMax -= 2;
					apparitionTimer = apparitionTimerMax;
				}
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
			
			audio_stop_sound(global.musicPlaying);
			
			with (obj_Player) scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_StarlessMarxIntro_Step);
			
			phaseTimer = 210;
		},
		function()
		{
			groundAlphaTarget = 1;
			
			phaseTimer = 120;
		},
		function()
		{
			scr_PlaySfx(snd_MKSS_MarxLaugh4);
			
			phaseTimer = 30;
		},
		function()
		{
			scr_PlaySfx(snd_MKSS_MarxLaugh3);
			
			phaseTimer = 10;
		},
		function()
		{
			scr_PlaySfx(snd_MKSS_MarxLaugh2);
			
			phaseTimer = 60;
		},
		function()
		{
			scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "starlessMarx"]);
			
			musicPlayed = true;
			
			skyAlphaTarget = 1;
			
			with (obj_Player)
			{
				scr_ChangeSprite(spriteSet.sprFront);
				
				lookingForward = true;
			}
			
			moveCamera = true;
			
			phaseTimer = 120;
		},
		function()
		{
			with (instance_create_layer(128,72,"Enemies",obj_MKSS_Enemy_StarlessMarx))
			{
				scr_MKSS_Enemy_StarlessMarx_AI_Normal_Setup();
			}
			
			marxSpawned = true;
			
			apparitionTimer = 60;
			phaseTimer = 60;
		},
		function()
		{
			phaseTimer = 60;
		},
		function()
		{
			var bossTitle = instance_create_depth(0,0,depth,obj_MKSS_UI_BossTitle);
			with (bossTitle)
			{
				text = "[" + MKSS_Base_Color_StarlessTitle + "]Starless Marx[/color]";
				subtext = "[" + MKSS_Base_Color_StarlessSubitle + "]Celestines of the Twisted Jester[/color]";
				destroyTimer = 180;
			}
			
			phaseTimer = 180;
		},
		function()
		{
			global.hasHud = true;
			global.canGamePause = true;
			global.MKSS_CutsceneStopMovement = false;
			
			if (!musicPlayed)
			{
				scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "starlessMarx"]);
				
				musicPlayed = true;
			}
			
			if (!marxSpawned)
			{
				with (instance_create_layer(128,72,"Enemies",obj_MKSS_Enemy_StarlessMarx))
				{
					scr_MKSS_Enemy_StarlessMarx_AI_Normal_Setup();
				}
				
				marxSpawned = true;
			}
			
			groundAlpha = 1;
			skyAlpha = 1;
			apparitionTimer = -1;
			cameraOffset = 0;
			
			with (obj_MKSS_BgEnv_StarlessMarxArena_Ground)
			{
				alpha = 1;
				image_alpha = alpha;
			}
			
			with (obj_MKSS_BgEnv_StarlessMarxArena)
			{
				alpha = 1;
				image_alpha = alpha;
			}
			
			with (obj_MKSS_CameraOffsetController) targetYOffset = other.cameraOffset;
			
			with (obj_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
					
				y = 152;
			}
			
			with (obj_MKSS_Enemy_StarlessMarx)
			{
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_StarlessMarx_AI_Normal_Idle_Step);
				sprite_index = spriteSet.sprIdle;
			}
			
			with (obj_MKSS_UI_BossTitle) instance_destroy();
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}