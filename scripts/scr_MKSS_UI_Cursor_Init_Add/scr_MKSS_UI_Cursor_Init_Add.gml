///@description MKSS - UI - Cursor - Init - Add

function scr_MKSS_UI_Cursor_Init_Add(targetID,targetName = "",targetSprite = -1)
{
	var targetMappedID = ds_map_size(global.MKSS_CursorIDs);
	ds_map_add(global.MKSS_CursorIDs,targetID,targetMappedID);
	
	global.MKSS_CursorList[global.MKSS_CursorIDs[? targetID]] = 
	{
        ID: targetID,
		name: targetName,
		sprite: targetSprite,
		
		isUnlocked: false,
		isDefault: false
    };
	
	return targetMappedID;
}