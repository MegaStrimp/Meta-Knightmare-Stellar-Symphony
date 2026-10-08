///@description MKSS - Upgrade - Init - Add

function scr_MKSS_Upgrade_Init_Add(targetID,targetCategoryID,targetX,targetY,targetDependency = -1,targetIsLesserNode = false)
{
	var targetMappedID = ds_map_size(global.MKSS_UpgradeIDs);
	ds_map_add(global.MKSS_UpgradeIDs,targetID,targetMappedID);
	
	global.MKSS_UpgradeList[global.MKSS_UpgradeIDs[? targetID]] = 
	{
        ID: targetID,
        categoryID: targetCategoryID,
        x: targetX,
        y: targetY,
		canBeUnlocked: ((!targetIsLesserNode) and (targetDependency == -1) and (global.MKSS_UpgradeTypeList[targetCategoryID].isUnlocked)),
		isUnlocked: false,
		dependency: targetDependency,
		isLesserNode: targetIsLesserNode,
		
		title: undefined,
		description: [undefined],
		icon: [undefined],
		price: 0,
		
		neighborLeft: undefined,
		neighborRight: undefined,
		neighborUp: undefined,
		neighborDown: undefined
    };
	
	return targetMappedID;
}