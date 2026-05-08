///@description MKSS - Spray Paint - Init - Add

function scr_MKSS_SprayPaint_Init_Add(targetID,targetName = "",targetSprite = undefined)
{
	var targetMappedID = ds_map_size(global.MKSS_SprayPaintIDs);
	ds_map_add(global.MKSS_SprayPaintIDs,targetID,targetMappedID);
	
	global.MKSS_SprayPaintList[global.MKSS_SprayPaintIDs[? targetID]] = 
	{
        ID: targetID,
		name: targetName,
		sprite: targetSprite,
		isUnlocked: false
    };
	
	return targetMappedID;
}