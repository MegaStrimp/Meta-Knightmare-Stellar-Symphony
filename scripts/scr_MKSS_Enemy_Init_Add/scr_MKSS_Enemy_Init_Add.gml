///@description MKSS - Enemy - Init - Add

function scr_MKSS_Enemy_Init_Add(targetID,targetName = "")
{
	var targetMappedID = ds_map_size(global.MKSS_EnemyIDs);
	ds_map_add(global.MKSS_EnemyIDs,targetID,targetMappedID);
	
	global.MKSS_EnemyList[global.MKSS_EnemyIDs[? targetID]] = 
	{
        ID: targetID,
		name: targetName,
		isUnlocked: false
    };
	
	return targetMappedID;
}