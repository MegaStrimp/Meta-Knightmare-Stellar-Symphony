///@description MKSS - Cutscene - Preset - Starry Shores Intro

function scr_MKSS_Cutscene_Preset_StarryShoresIntro()
{
	#region Setup
	canBePaused = false;
	#endregion
	
	#region Step Script
	stepScript = function()
	{
	};
	#endregion
	
	#region Phase Setup Scripts
	phaseSetupScript = 
	[
		function()
		{
			global.canGamePause = false;
			global.MKSS_CutsceneStopMovement = true;
			
			with (obj_MKSS_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_StarryShoresIntro_Step);
			}
			
			phaseTimer = 300;
		},
		function()
		{
			with (obj_MKSS_Player)
			{
				image_index = 1;
			}
			
			phaseTimer = 120;
		},
		function()
		{
			global.canGamePause = true;
			global.MKSS_CutsceneStopMovement = false;
			
			with (obj_MKSS_Player)
			{
				scr_MKSS_Player_SetTutorialText("[leftIcon][rightIcon] Walk",300);
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
			}
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}