///@description MKSS - UI - Button - Component - Save - Trigger

function scr_MKSS_UI_Button_Component_Save_Trigger(targetSave)
{
	if (!instance_exists(obj_Transition))
	{
		var sfx = scr_PlaySfx(snd_MKSS_DoorEnter);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		scr_Music_SetFade(0);
		
		global.selectedSave = targetSave;
		global.lastSelectedSave = global.selectedSave;
		
		scr_MKSS_SaveGeneral("general.ini");
		scr_MKSS_LoadCrossovers(global.selectedSave);
		scr_MKSS_LoadData(global.selectedSave);
		scr_MKSS_Player_SetWeapons();
		
		var targetRoom = rm_MKSS_BattleshipHalberd;
		var targetAlphaSpd = .05;
		if (global.debug)
		{
			targetRoom = rm_MKSS_Debug_Lobby;
		}
		else if (global.demo)
		{
			targetRoom = rm_MKSS_Debug_Lobby_Beta;
		}
		else if (!global.MKSS_StageList[global.MKSS_StageIDs[? "iceCreamIsland"]].isBeaten)
		{
			targetRoom = rm_MKSS_IceCreamIsland_1;
			var targetAlphaSpd = .01;
		}
		
		with (scr_GoToRoom(targetRoom,true))
		{
			alphaSpd = targetAlphaSpd;
		}
	}
}