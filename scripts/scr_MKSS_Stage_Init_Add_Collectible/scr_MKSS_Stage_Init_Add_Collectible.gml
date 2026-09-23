///@description MKSS - Stage - Init - Add - Collectible

function scr_MKSS_Stage_Init_Add_Collectible(targetStageID,targetID,targetIcon = undefined,targetHiddenColor = c_black)
{
	var targetStage = global.MKSS_StageList[targetStageID];
	
	var targetMappedID = array_length(targetStage.collectibles);
	ds_map_add(global.MKSS_CollectibleIDs,targetID,targetMappedID);
	
	targetStage.collectibles[targetMappedID] = 
	{
        ID: targetID,
		icon: targetIcon,
		hiddenColor: targetHiddenColor,
        isObtained: false
    };
	
	return targetMappedID;
}