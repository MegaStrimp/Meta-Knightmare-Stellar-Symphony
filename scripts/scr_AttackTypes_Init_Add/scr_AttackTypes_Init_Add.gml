///@description Attack Types - Init - Add

function scr_AttackTypes_Init_Add(targetID)
{
	ds_map_add(global.AttackTypeIDs,targetID,ds_map_size(global.AttackTypeIDs));
	
	global.AttackTypeList[global.AttackTypeIDs[? targetID]] = 
	{
        id: targetID
    };
}