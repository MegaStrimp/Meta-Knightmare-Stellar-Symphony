///@description MKSS - UI - Score Bonus - Init - Add

function scr_MKSS_UI_ScoreBonus_Init_Add(targetID,targetUnlockScript,targetMetaPointCount = 100,targetSprite = -1)
{
	var targetMappedID = ds_map_size(global.MKSS_ScoreBonusIDs);
	ds_map_add(global.MKSS_ScoreBonusIDs,targetID,targetMappedID);
	
	global.MKSS_ScoreBonusList[targetMappedID] = 
	{
        ID: targetID,
        unlockScript: targetUnlockScript,
        metaPointCount: targetMetaPointCount,
        sprite: targetSprite
	}
	
	return targetMappedID;
}