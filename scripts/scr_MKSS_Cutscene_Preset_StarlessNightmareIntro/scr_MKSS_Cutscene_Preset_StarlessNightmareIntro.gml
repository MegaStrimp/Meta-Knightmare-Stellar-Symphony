///@description MKSS - Cutscene - Preset - Starless Nightmare Intro

function scr_MKSS_Cutscene_Preset_StarlessNightmareIntro()
{
	#region Setup
	bossSpawned = false;
	musicPlayed = false;
	
	nightmareSpawned = false;
	#endregion
	
	#region Step Script
	stepScript = function()
	{
		if (!localPause)
		{
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
			
			with (obj_Player)
			{
				attackMakeHeavyInvincible = true;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_StarlessNightmareIntro_Step);
			}
			
			phaseTimer = 100;
		},
		function()
		{
			var bossTitle = instance_create_depth(0,0,0,obj_MKSS_UI_BossTitle);
			with (bossTitle)
			{
				text = "[" + MKSS_Base_Color_StarlessTitle + "]Starless Nightmare[/color]";
				subtext = "[" + MKSS_Base_Color_StarlessSubitle + "]King of Astral Dreams[/color]";
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
				scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "starlessNightmare"]);
				
				musicPlayed = true;
			}
			
			if (!nightmareSpawned)
			{
				with (instance_create_layer(128,72,"Enemies",obj_MKSS_Enemy_StarlessNightmare))
				{
					scr_MKSS_Enemy_StarlessNightmare_AI_Normal_Setup();
				}
				
				nightmareSpawned = true;
			}
			
			with (obj_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
			}
			
			with (obj_MKSS_Enemy_StarlessNightmare)
			{
				//scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_StarlessNightmare_AI_Normal_Idle_Step);
				//sprite_index = spriteSet.sprIdle;
			}
			
			with (obj_MKSS_UI_BossTitle) instance_destroy();
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}