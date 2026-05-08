///@description MKSS - Attack - Init - Add

function scr_MKSS_Attack_Init_Add(targetID,targetExecuteAttackScript = undefined)
{
	var targetMappedID = ds_map_size(global.MKSS_AttackIDs);
	ds_map_add(global.MKSS_AttackIDs,targetID,targetMappedID);
	
	global.MKSS_AttackList[global.MKSS_AttackIDs[? targetID]] = 
	{
        ID: targetID,
		executeAttackScript: targetExecuteAttackScript
    };
	
	return targetMappedID;
}