///@description MKSS - Stage - Begin

function scr_MKSS_Stage_Begin(targetStageID = -1)
{
	#region Event Inherited
	scr_Stage_Begin(targetStageID);
	#endregion
	
	#region Variables
	if (targetStageID != -1)
	{
		var mappedID = global.MKSS_StageIDs[? targetStageID];
		
		global.MKSS_StageHasScore = global.MKSS_StageList[mappedID].hasScore;
		
		global.MKSS_MedalScoreTargetBronze = global.MKSS_StageList[mappedID].medalScores[0];
		global.MKSS_MedalScoreTargetSilver = global.MKSS_StageList[mappedID].medalScores[1];
		global.MKSS_MedalScoreTargetGold = global.MKSS_StageList[mappedID].medalScores[2];
		global.MKSS_MedalScoreTargetPlatinum = global.MKSS_StageList[mappedID].medalScores[3];
		
		with (obj_FrameworkControl) MKSS_GamePause_DecalPalette = global.MKSS_StageList[mappedID].decalPalette;
	}
	#endregion
}