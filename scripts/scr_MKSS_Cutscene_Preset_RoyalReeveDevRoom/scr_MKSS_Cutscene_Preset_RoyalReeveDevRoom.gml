///@description MKSS - Cutscene - Preset - Royal Reeve Dev Room

function scr_MKSS_Cutscene_Preset_RoyalReeveDevRoom()
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
			
			scr_Music_SetFade(0);
			
			with (obj_Player)
			{
				scr_Player_CancelAttack(id,attackIndex);
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_RoyalReeveDevRoom_Step);
			}
			
			phaseTimer = 30;
		},
		function()
		{
			scr_Camera_FollowPosition(648,72);
			scr_Camera_SetState(scr_Camera_State_FollowPosition);
			
			with (obj_Player)
			{
				lookingForward = true;
				clampToView = false;
			}
			
			phaseTimer = 120;
		},
		function()
		{
			scr_PlaySfx(snd_MKSS_BlooBird);
			
			phaseTimer = 120;
		},
		function()
		{
			audio_sound_set_track_position(global.musicPlaying,global.MKSS_MusicList[global.MKSS_MusicIDs[? "royalReeve"]].timestamps[0]);
			
			scr_Music_SetFade(1,,0);
			
			scr_Camera_FollowPosition(obj_Player.x,obj_Player.y);
			scr_Camera_SetState(scr_Camera_State_FollowPosition);
			
			phaseTimer = 30;
		},
		function()
		{
			instance_create_depth(0,0,0,obj_MKSS_BlooRoomReward);
			
			phaseTimer = 30;
		},
		function()
		{
			with (obj_Player)
			{
				lookingForward = false;
			}
			
			phaseTimer = 120;
		},
		function()
		{
			global.hasHud = true;
			global.canGamePause = true;
			global.MKSS_CutsceneStopMovement = false;
			
			scr_Camera_SetState(scr_Camera_State_FollowObject);
			
			with (obj_Player)
			{
				clampToView = true;
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
			}
			
			instance_destroy();
			
			phaseTimer = -1;
		}
	];
	#endregion
}