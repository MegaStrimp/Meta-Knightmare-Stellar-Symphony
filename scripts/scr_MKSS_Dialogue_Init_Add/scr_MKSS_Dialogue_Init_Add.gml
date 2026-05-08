///@description MKSS - Dialogue - Init - Add

function scr_MKSS_Dialogue_Init_Add(targetID,targetDialogue = [])
{
	var targetMappedID = ds_map_size(global.MKSS_DialogueIDs);
	ds_map_add(global.MKSS_DialogueIDs,targetID,targetMappedID);
	
	global.MKSS_DialogueList[global.MKSS_DialogueIDs[? targetID]] = 
	{
        ID: targetID,
		dialogue: targetDialogue,
		
        seen: false
    };
	
	return targetMappedID;
}