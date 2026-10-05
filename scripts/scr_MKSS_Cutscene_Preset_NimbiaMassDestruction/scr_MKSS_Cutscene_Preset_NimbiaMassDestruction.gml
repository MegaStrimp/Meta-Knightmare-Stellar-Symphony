///@description MKSS - Cutscene - Preset - Nimbia Mass Destruction

function scr_MKSS_Cutscene_Preset_NimbiaMassDestruction()
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
			
			with (obj_MKSS_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDBuzzcutSpam_Step);
			}
			
			with (obj_MKSS_Enemy_Nimbia)
			{
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Nimbia_AI_Cutscene_MDBuzzsawBlock_Step);
			}
			
			phaseTimer = 120;
		},
		function()
		{
			with (obj_MKSS_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDGalaxiaCharge_Step);
			}
			phaseTimer = 120
		},
		function()
		{
			with (obj_MKSS_Enemy_Nimbia)
			{
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Nimbia_AI_Cutscene_MDLostClash_Step)
			}
			phaseTimer = 30
		},
		function()
		{
			with (obj_MKSS_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDDownKick_Step)
			}
			phaseTimer = 180
		},
		function()
		{
			with (obj_MKSS_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDBuzzcutStunlock_Step)
			}	
			phaseTimer = 180
		},
		function()
		{
			with (obj_MKSS_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDGalaxiaFinisher_Step)
			}	
			phaseTimer = 180
		},
		function()
		{
			with (obj_MKSS_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step)
			}
			phaseTimer = 1
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