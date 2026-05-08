///@description MKSS - Upgrade Type - Init - Add

function scr_MKSS_UpgradeType_Init_Add(targetID,targetName = "",targetConstellationSetupScript = undefined)
{
	var targetMappedID = ds_map_size(global.MKSS_UpgradeTypeIDs);
	ds_map_add(global.MKSS_UpgradeTypeIDs,targetID,targetMappedID);
	
	global.MKSS_UpgradeTypeList[global.MKSS_UpgradeTypeIDs[? targetID]] = 
	{
        ID: targetID,
		name: targetName,
		constellationSetupScript: targetConstellationSetupScript
    };
	
	return targetMappedID;
}