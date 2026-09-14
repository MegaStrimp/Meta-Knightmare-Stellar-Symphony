///@description MKSS - Cutscene - Preset - Starless Marx Mass Destruction

function scr_MKSS_Cutscene_Preset_StarlessMarxMassDestruction()
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
	
	phaseSetupScript = 
	[
		function()
		{
			global.hasHud = false;
			global.canGamePause = false;
			global.MKSS_CutsceneStopMovement = true;
			
			if (!instance_exists(obj_MKSS_Enemy_StarlessMarx))
			{
				with (instance_create_layer(128,72,"Enemies",obj_MKSS_Enemy_StarlessMarx))
				{
					scr_MKSS_Enemy_StarlessMarx_AI_Normal_Setup();
				}
			}
			with (obj_MKSS_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_StarlessMarxMDSlash_Step);
			}
			phaseTimer = 300
		},
		function()
		{
			with (obj_MKSS_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_StarlessMarxMDBuzzcut_Step);
			}
			phaseTimer = 120
		},
		function()
		{
			with (obj_MKSS_Enemy_StarlessMarx)
			{
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_StarlessMarx_AI_Cutscene_MDArrowFlurry_Step);
			}
			phaseTimer = 300
		},
		function()
		{
			global.MKSS_CutsceneStopMovement = false;
			
			with (obj_MKSS_Enemy_StarlessMarx) deathTimer = 0;
			
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
	]
}