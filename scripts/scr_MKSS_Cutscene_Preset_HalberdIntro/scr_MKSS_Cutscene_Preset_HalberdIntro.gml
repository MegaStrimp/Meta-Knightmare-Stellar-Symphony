///@description MKSS - Cutscene - Preset - Halberd Intro

function scr_MKSS_Cutscene_Preset_HalberdIntro()
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
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}