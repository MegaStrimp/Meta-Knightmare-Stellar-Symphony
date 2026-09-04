///@description MKSS - Cutscene - Preset - Ice Cream Island End

function scr_MKSS_Cutscene_Preset_IceCreamIslandEnd()
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
			var bossTitle = instance_create_depth(0,0,0,obj_MKSS_UI_BossTitle);
			with (bossTitle)
			{
				text = "[" + MKSS_Base_Color_StarlessTitle + "]Starless Nebula[/color]";
				subtext = "[" + MKSS_Base_Color_StarlessSubitle + "]Pulsar of Ever Doom[/color]";
				destroyTimer = 180;
			}
			
			phaseTimer = 180;
		}
	];
	#endregion
}