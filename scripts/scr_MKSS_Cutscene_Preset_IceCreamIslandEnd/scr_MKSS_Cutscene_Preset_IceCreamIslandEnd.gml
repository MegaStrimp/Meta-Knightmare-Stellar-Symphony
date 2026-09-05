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
			global.hasHud = false;
			global.canGamePause = false;
			global.MKSS_CutsceneStopMovement = true;
			
			phaseTimer = 30;
		},
		function()
		{
			global.hasHud = true;
			global.canGamePause = true;
			global.MKSS_CutsceneStopMovement = false;
			
			room_goto(rm_MKSS_StarryShores_1);
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}