///@description Stage - Begin

function scr_Stage_Begin(targetStageID = -1)
{
	#region Variables
	global.inStage = true;
	global.currentStage = targetStageID;
	#endregion
	
	#region Stage Entity Tracker
	scr_StageEntityTracker_Init();
	#endregion
}