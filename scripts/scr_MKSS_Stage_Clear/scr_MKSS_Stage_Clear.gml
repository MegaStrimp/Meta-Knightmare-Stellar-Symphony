///@description MKSS - Stage - Clear

function scr_MKSS_Stage_Clear(hasClearSequence = true)
{
	#region Variables
	var rawScore = global.levelScoreCurrent;
	
	with (obj_MKSS_Control)
	{
		specialDeflationTimer = -1;
		
		for (var i = 0; i < global.maxPlayers; i++)
		{
			playerMetaQuickTimer[i] = -1;
		}
	}
	#endregion
	
	#region Save Stage Data
	if (global.currentStage != -1)
	{
		var stageMappedID = global.MKSS_StageIDs[? global.currentStage];
		
		if (global.levelScoreCurrent > global.MKSS_StageList[stageMappedID].earnedHighScore)
		{
			global.MKSS_StageList[stageMappedID].earnedHighScore = global.levelScoreCurrent;
		}
		
		global.MKSS_StageList[stageMappedID].isBeaten = true;
		if (global.MKSS_StageList[stageMappedID].clearScript != -1) script_execute(global.MKSS_StageList[stageMappedID].clearScript,stageMappedID);
	}
	
	scr_MKSS_SaveData(global.selectedSave);
	#endregion
	
	#region Animation
	if (hasClearSequence)
	{
		scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "stageClear"]);
		
		with (obj_MKSS_UI_FadingText) instance_destroy();
		
		with (obj_Player)
		{
			scr_Player_CancelAttack(id,attackIndex);
		
			scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_StageClear_Step);
		}
		
		scr_MKSS_UI_StageClear_Create(rawScore);
	}
	#endregion
}