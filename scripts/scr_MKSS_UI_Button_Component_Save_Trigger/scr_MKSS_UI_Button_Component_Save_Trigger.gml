///@description MKSS - UI - Button - Component - Save - Trigger

function scr_MKSS_UI_Button_Component_Save_Trigger(targetSave)
{
	if (!instance_exists(obj_Transition))
	{
		scr_PlaySfx(snd_MKSS_DoorEnter);
		scr_Music_SetFade(0);
		
		global.selectedSave = targetSave;
		global.lastSelectedSave = global.selectedSave;
		
		scr_MKSS_SaveGeneral("general.ini");
		scr_MKSS_LoadData(global.selectedSave);
		scr_MKSS_Player_SetWeapons();
		
		var targetRoom = rm_MKSS_BattleshipHalberd;
		var targetAlphaSpd = .05;
		if (!global.MKSS_StageList[global.MKSS_StageIDs[? "iceCreamIsland"]].isBeaten)
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