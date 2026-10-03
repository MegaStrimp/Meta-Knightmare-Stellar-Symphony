///@description MKSS - UI - Cursor - Set List

function scr_MKSS_UI_Cursor_SetList()
{
	ds_list_clear(global.MKSS_AvailableCursors);
	
	for (var i = 0; i < ds_map_size(global.MKSS_CursorIDs); i++)
	{
		if (global.MKSS_CursorList[i].isUnlocked)
		{
			ds_list_add(global.MKSS_AvailableCursors,i);
		}
	}
}