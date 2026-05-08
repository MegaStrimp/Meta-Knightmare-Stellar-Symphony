///@description MKSS - Player - Init - Add

function scr_MKSS_Player_Init_Add(targetID,targetName = "",targetSetupScript = undefined)
{
	var targetMappedID = ds_map_size(global.MKSS_PlayerIDs);
	ds_map_add(global.MKSS_PlayerIDs,targetID,targetMappedID);
	
	global.MKSS_PlayerList[global.MKSS_PlayerIDs[? targetID]] = 
	{
        ID: targetID,
		name: targetName,
		setupScript: targetSetupScript
    };
	
	return targetMappedID;
}