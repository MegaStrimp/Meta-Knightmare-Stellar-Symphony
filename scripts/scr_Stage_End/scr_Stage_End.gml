///@description Stage - End

function scr_Stage_End()
{
	#region Variables
	global.inStage = false;
	global.levelScoreCurrent = 0;
	#endregion
	
	#region Stage Entity Tracker
	scr_StageEntityTracker_Destroy();
	#endregion
}