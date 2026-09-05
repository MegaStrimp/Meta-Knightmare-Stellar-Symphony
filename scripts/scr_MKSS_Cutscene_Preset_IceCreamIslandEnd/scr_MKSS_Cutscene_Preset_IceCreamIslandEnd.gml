///@description MKSS - Cutscene - Preset - Ice Cream Island End

function scr_MKSS_Cutscene_Preset_IceCreamIslandEnd()
{
	#region Setup
	goneToStage = false;
	
	persistent = true;
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
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_IceCreamIslandEnd_Step);
			}
			
			phaseTimer = 30;
		},
		function()
		{
			room_goto(rm_MKSS_StarryShores_1);
			goneToStage = true;
			
			phaseTimer = 0;
		},
		function()
		{
			global.hasHud = false;
			global.canGamePause = false;
			global.MKSS_CutsceneStopMovement = true;
			
			with (obj_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_IceCreamIslandEnd_Step);
				
				scr_ChangeSprite(spriteSet.sprFallen);
				
				hsp = 0;
				vsp = 0;
			}
			
			phaseTimer = 0;
		},
		function()
		{
			with (obj_Player)
			{
				scr_ChangeSprite(spriteSet.sprFallen);
				
				fallen = true;
			}
			
			phaseTimer = 30;
		},
		function()
		{
			global.hasHud = true;
			global.canGamePause = true;
			global.MKSS_CutsceneStopMovement = false;
			
			if (!goneToStage)
			{
				room_goto(rm_MKSS_StarryShores_1);
			}
			
			global.MKSS_WeaponList[global.MKSS_WeaponIDs[? "galaxia"]].isUnlocked = false;
			
			with (obj_Player)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
			}
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}