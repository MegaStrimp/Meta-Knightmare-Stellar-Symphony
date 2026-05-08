///@description MKSS - Score - Add

function scr_MKSS_Score_Add(targetScore)
{
	if ((global.inStage) and (global.MKSS_StageHasScore))
	{
		global.levelScoreCurrent += targetScore;
		
		with (obj_FrameworkControl)
		{
			if ((hud_MedalTier == -1) and (global.levelScoreCurrent >= global.MKSS_MedalScoreTargetBronze))
			{
				scr_MKSS_Hud_Medal_Get(0);
			}
			
			if ((hud_MedalTier == 0) and (global.levelScoreCurrent >= global.MKSS_MedalScoreTargetSilver))
			{
				scr_MKSS_Hud_Medal_Get(1);
			}
			
			if ((hud_MedalTier == 1) and (global.levelScoreCurrent >= global.MKSS_MedalScoreTargetGold))
			{
				scr_MKSS_Hud_Medal_Get(2);
			}
			
			if ((hud_MedalTier == 2) and (global.levelScoreCurrent >= global.MKSS_MedalScoreTargetPlatinum))
			{
				scr_MKSS_Hud_Medal_Get(3);
			}
		}
	}
}