///@description MKSS - Upgrade - Init - Add

function scr_MKSS_Upgrade_Init_Add(targetID,targetCategoryID,targetX,targetY)
{
	var targetMappedID = ds_map_size(global.MKSS_UpgradeIDs);
	ds_map_add(global.MKSS_UpgradeIDs,targetID,targetMappedID);
	
	global.MKSS_UpgradeList[global.MKSS_UpgradeIDs[? targetID]] = 
	{
        ID: targetID,
        categoryID: targetCategoryID,
        x: targetX,
        y: targetY,
		canBeUnlocked: false,
		isUnlocked: false
    };
	
	return targetMappedID;
}