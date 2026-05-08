///@description MKSS - UI - Button - Component - Save - Trigger

function scr_MKSS_UI_Button_Component_Save_Trigger(targetSave)
{
	scr_PlaySfx(snd_MKSS_ButtonYes);
	
	global.selectedSave = targetSave;
	global.lastSelectedSave = global.selectedSave;
	
	scr_MKSS_SaveGeneral("general.ini");
	//scr_MKSS_LoadData(global.selectedSave); STRIMPTODO
	
	scr_GoToRoom(rm_MKSS_Debug_Lobby,true);
}