///@description MKSS - Cutscene - Preset - Ice Cream Island End

function scr_MKSS_Cutscene_Preset_IceCreamIslandEnd()
{
	#region Setup
	goneToStage = false;
	weaponLost = false;
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
			global.MKSS_WeaponList[global.MKSS_WeaponIDs[? "galaxia"]].isUnlocked = false;
			scr_MKSS_Player_SetWeapons();
			weaponLost = true;
			
			phaseTimer = 30;
		},
		function()
		{
			with (scr_GoToRoom(rm_MKSS_StarryShores_1,true))
			{
				alphaSpd = .01;
			}
			goneToStage = true;
			
			phaseTimer = -1;
		},
		function()
		{
			if (!goneToStage)
			{
				room_goto(rm_MKSS_StarryShores_1);
			}
			
			if (!weaponLost)
			{
				global.MKSS_WeaponList[global.MKSS_WeaponIDs[? "galaxia"]].isUnlocked = false;
				scr_MKSS_Player_SetWeapons();
			}
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}