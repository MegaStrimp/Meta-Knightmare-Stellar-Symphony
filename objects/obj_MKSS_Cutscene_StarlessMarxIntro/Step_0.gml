///@description Main

if (!localPause)
{
	#region Pause
	if (input_check_pressed("start",playerNum))
	{
		global.MKSS_CutsceneIsPaused = true;
	}
	#endregion
	
	#region Environment
	groundAlpha = lerp(groundAlpha,phase > 1,.05);
	skyAlpha = lerp(skyAlpha,phase > 5,.05);
	#endregion
	
	#region Camera
	if ((phase > 5) and (phase < 10))
	{
		cameraOffset = max(cameraOffset - .25,-70);
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
				
				case 1:
				phaseTimer = 120;
				break;
				
				case 2:
				scr_PlaySfx(snd_MKSS_MarxLaugh4);
				
				phaseTimer = 30;
				break;
				
				case 3:
				scr_PlaySfx(snd_MKSS_MarxLaugh3);
				
				phaseTimer = 10;
				break;
				
				case 4:
				scr_PlaySfx(snd_MKSS_MarxLaugh2);
				
				phaseTimer = 60;
				break;
				
				case 5:
				scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "starlessMarx"]);
				
				musicPlayed = true;
				
				phaseTimer = 120;
				break;
				
				case 6:
				with (instance_create_layer(128,72,"Enemies",obj_MKSS_Enemy_StarlessMarx))
				{
					scr_MKSS_Enemy_StarlessMarx_AI_Normal_Setup();
				}
				
				marxSpawned = true;
				
				apparitionTimer = 60;
				phaseTimer = 60;
				break;
				
				case 7:
				phaseTimer = 60;
				break;
				
				case 8:
				var bossTitle = instance_create_depth(0,0,depth,obj_MKSS_UI_BossTitle);
				with (bossTitle)
				{
					text = "[#74B8FF]Starless Marx[/color]";
					subtext = "[#235297]Celestines of the Twisted Jester[/color]";
					destroyTimer = 180;
				}
				
				phaseTimer = 180;
				break;
				
				case 9:
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
				#endregion
				
				with (obj_Player) y = 152;
				
				with (obj_MKSS_Enemy_StarlessMarx)
				{
					scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_StarlessMarx_AI_Normal_Idle_Step);
					sprite_index = spriteSet.sprIdle;
				}
				
				with (obj_MKSS_UI_BossTitle) instance_destroy();
				
				instance_destroy();
				
				phaseTimer = -1;
				break;
			}
			
			phase += 1;
		}
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
			
			scr_PlaySfx(snd_MKSS_MarxRise);
			var laughSfx = scr_PlaySfx(choose(snd_MKSS_MarxLaugh1,snd_MKSS_MarxLaugh2,snd_MKSS_MarxLaugh3,snd_MKSS_MarxLaugh4));
			
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