///@description MKSS - UI - Gem Intro - Create

function scr_MKSS_UI_GemIntro_Create(targetTitle,targetSubitle,targetDescription,targetStageID,targetDecalPalette = -1)
{
	with (instance_create_depth(0,0,0,obj_MKSS_UI_GemIntro))
	{
		title = targetTitle;
		subtitle = targetSubitle;
		description = targetDescription;
		decalPalette = targetDecalPalette;
		stageScore = global.MKSS_StageList[targetStageID].earnedHighScore;
		
		switch (global.MKSS_StageList[targetStageID].earnedMedal)
		{
			case -1:
			medalSprite = spr_MKSS_UI_Medal_None;
			stageScoreFont = "[fnt_Advance_Gray]";
			break;
			
			case 0:
			medalSprite = spr_MKSS_UI_Medal_Bronze;
			stageScoreFont = "[fnt_Advance_Gray]"; //STRIMPTODO
			break;
			
			case 1:
			medalSprite = spr_MKSS_UI_Medal_Silver;
			stageScoreFont = "[fnt_Advance_Gray]";
			break;
			
			case 2:
			medalSprite = spr_MKSS_UI_Medal_Gold;
			stageScoreFont = "[fnt_Advance_Gray]";
			break;
			
			case 3:
			medalSprite = spr_MKSS_UI_Medal_Platinum;
			stageScoreFont = "[fnt_Advance_Gray]";
			break;
		}
	}
}