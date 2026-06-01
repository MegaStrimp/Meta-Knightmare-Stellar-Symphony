///@description MKSS - Stage - Init - Add

function scr_MKSS_Stage_Init_Add(targetID,targetName = "",targetMedalScores = [0,0,0,0],targetHasScore = true,targetDecalPalette = -1)
{
	var targetMappedID = ds_map_size(global.MKSS_StageIDs);
	ds_map_add(global.MKSS_StageIDs,targetID,targetMappedID);
	
	global.MKSS_StageList[global.MKSS_StageIDs[? targetID]] = 
	{
        ID: targetID,
        name: targetName,
        isUnlocked: false,
        isBeaten: false,
		isDefault: false,
        earnedHighScore: 0,
        medalScores: targetMedalScores,
        hasScore: targetHasScore,
        earnedMedal: -1,
		collectibles: [],
		icon: undefined,
		
		decalPalette: targetDecalPalette
    };
	
	return targetMappedID;
}