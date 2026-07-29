///@description MKSS - UI - Stage Clear - Create

function scr_MKSS_UI_StageClear_Create(targetScore = global.levelScoreCurrent,targetScoreBonuses = [],targetNextRoom = -1,targetRetryRoom = -1)
{
	var xx = camera_get_view_x(mainView) + (global.gameWidth / 2);
	var yy = camera_get_view_y(mainView) + (global.gameHeight / 2);
	var currentStageID = global.MKSS_StageIDs[? global.currentStage];
	
	with (instance_create_layer(xx,yy,"Player",obj_MKSS_UI_StageClear))
	{
		currentScore = targetScore;
		scoreBonuses = targetScoreBonuses;
		
		if (targetNextRoom != -1)
		{
			targetRoom_Next = targetNextRoom;
		}
		else if ((currentStageID != -1) and (currentStageID < ds_map_size(global.MKSS_StageIDs)) and (global.MKSS_StageList[currentStageID + 1].isUnlocked))
		{
			targetRoom_Next = global.MKSS_StageList[currentStageID + 1].firstRoom;
		}
		
		if (targetRetryRoom != -1)
		{
			targetRoom_Retry = targetRetryRoom;
		}
		else if (currentStageID != -1)
		{
			targetRoom_Retry = global.MKSS_StageList[currentStageID].firstRoom;
		}
		
		scr_Camera_FollowObject(id);
	}
}