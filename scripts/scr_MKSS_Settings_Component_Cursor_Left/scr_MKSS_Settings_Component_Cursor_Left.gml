///@description MKSS - Settings - Component - Cursor - Left

function scr_MKSS_Settings_Component_Cursor_Left()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	global.MKSS_CurrentCursorID = (ds_list_find_index(global.MKSS_AvailableCursors,global.MKSS_CurrentCursorID) + ds_list_size(global.MKSS_AvailableCursors) - 1) % ds_list_size(global.MKSS_AvailableCursors);
	global.customCursorSprite = global.MKSS_CursorList[global.MKSS_CurrentCursorID].sprite;
}