///@description MKSS - Cutscene - Preset - Starless Nightmare Intro

function scr_MKSS_Cutscene_Preset_StarlessNightmareIntro()
{
	/*
	Black stage
	Orb appears
	Orb runs to the right
	MK starts running
	Orb is getting closer to MK
	Orb flies upwards fast and in an arc
	Returns in his wizard dash form and goes off screen to the left
	Black overlay is gone
	Teleports to the center with namedrop and music
	*/
	
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
			var bossTitle = instance_create_depth(0,0,0,obj_MKSS_UI_BossTitle);
			with (bossTitle)
			{
				text = "[" + MKSS_Base_Color_StarlessTitle + "]Starless Nightmare[/color]";
				subtext = "[" + MKSS_Base_Color_StarlessSubitle + "]King of Astral Dreams[/color]";
				destroyTimer = 180;
			}
			
			phaseTimer = 180;
		}
	];
	#endregion
}