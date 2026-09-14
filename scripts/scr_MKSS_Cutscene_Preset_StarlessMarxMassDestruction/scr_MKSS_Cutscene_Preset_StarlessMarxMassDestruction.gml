function scr_MKSS_Cutscene_Preset_StarlessMarxMassDestruction(){
	
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
			phaseTimer = 300
		}
	]
}