///@description MKSS - UI - Cursor - Init - Set

function scr_MKSS_UI_Cursor_Init_Set()
{
	#region Setup
	global.MKSS_CursorList = [];
	global.MKSS_CursorIDs = ds_map_create();
	#endregion
	
	#region Spray Paints
	var targetMappedID = scr_MKSS_UI_Cursor_Init_Add("none","None",-1);
	global.MKSS_WeaponList[targetMappedID].isDefault = true;
	var targetMappedID = scr_MKSS_UI_Cursor_Init_Add("star","Star",spr_MKSS_UI_Cursor_Star);
	global.MKSS_WeaponList[targetMappedID].isDefault = true;
	#endregion
}