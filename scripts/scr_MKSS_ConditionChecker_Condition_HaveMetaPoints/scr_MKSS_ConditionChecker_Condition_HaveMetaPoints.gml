///@description MKSS - Condition Checker - Condition - Have Meta Points

function scr_MKSS_ConditionChecker_Condition_HaveMetaPoints(targetMetaPoints,targetPlayerNum = 0)
{
	return (global.MKSS_PlayerMetaPoints[targetPlayerNum] >= targetMetaPoints);
}