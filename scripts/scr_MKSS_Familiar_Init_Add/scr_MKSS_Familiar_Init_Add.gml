///@description MKSS - Add Familiar

function scr_MKSS_Familiar_Init_Add(targetID,targetName = "",targetSprite = undefined)
{
	var targetMappedID = ds_map_size(global.MKSS_FamiliarIDs);
	ds_map_add(global.MKSS_FamiliarIDs,targetID,targetMappedID);
	
	global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? targetID]] = 
	{
        ID: targetID,
		name: targetName,
		sprite: targetSprite,
		isUnlocked: false
    };
	
	return targetMappedID;
}