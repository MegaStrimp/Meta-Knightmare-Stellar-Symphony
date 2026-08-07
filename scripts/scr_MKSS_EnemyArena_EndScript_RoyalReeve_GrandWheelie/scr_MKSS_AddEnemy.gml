///@description MKSS - Add Enemy

function scr_MKSS_AddEnemy(targetID,targetName)
{
	ds_map_add(global.MKSS_EnemyIDs,targetID,ds_map_size(global.MKSS_EnemyIDs));
	
	global.MKSS_EnemyList[global.MKSS_EnemyIDs[? targetID]] = 
	{
        id: targetID,
        name: targetName
    };
}