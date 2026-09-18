///@description MKSS - Cutscene - Preset - Ivy Mass Destruction

function scr_MKSS_Cutscene_Preset_IvyMassDestruction()
{
	#region Setup
	canBePaused = false;
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
			
			//with (obj_MKSS_Player)
			//{
			//	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_SOMETHING_Step);
			//}
			
			//with (obj_MKSS_Enemy_Ivy)
			//{
			//	scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_obj_MKSS_Enemy_Ivy_AI_Cutscene_SOMETHING_Step);
			//}
			
			phaseTimer = 60;
		},
		function()
		{
			global.MKSS_CutsceneStopMovement = false;
			
			with (obj_Enemy) deathTimer = 0;
			
			phaseTimer = 60;
		},
		function()
		{
			global.hasHud = true;
			global.canGamePause = true;
			global.MKSS_CutsceneStopMovement = false;
			
			scr_MKSS_Stage_Clear();
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}