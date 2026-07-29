///@description MKSS - Stage - Clear Script - Starry Shores

function scr_MKSS_Stage_ClearScript_StarryShores()
{
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "stageClear"]);
	
	with (obj_MKSS_UI_FadingText) instance_destroy();
	
	with (obj_Player)
	{
		scr_Player_CancelAttack(id,attackIndex);
		
		scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_StageClear_Step);
	}
	
	var rawScore = -1;
	
	if (global.MKSS_StageList[global.MKSS_StageIDs[? global.currentStage]].hasScore)
	{
		rawScore = global.levelScoreCurrent;
		
		if (global.levelScoreCurrent > global.MKSS_StageList[global.MKSS_StageIDs[? global.currentStage]].earnedHighScore)
		{
			global.MKSS_StageList[global.MKSS_StageIDs[? global.currentStage]].earnedHighScore = global.levelScoreCurrent;
		}
	}
	
	//STRIMPTODO Unlock next stage
	
	scr_MKSS_UI_StageClear_Create(rawScore);
}