///@description MKSS - Stage - Init - Add - Collectible

function scr_MKSS_Stage_Init_Add_Collectible(targetStageID,targetID)
{
	var targetMappedID = ds_map_size(global.MKSS_CollectibleIDs);
	ds_map_add(global.MKSS_CollectibleIDs,targetID,targetMappedID);
	
	var targetStage = global.MKSS_StageList[targetStageID];
	
	targetStage.collectibles[array_length(targetStage.collectibles)] = 
	{
        ID: targetID,
        isObtained: false
    };
	
	return targetMappedID;
}