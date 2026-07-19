///@description Begin Step

#region Variables
speedMultFinal = global.speedMultGlobal * global.speedMultEnvironment * global.deltaTime;
localPause = global.pauseFinal;
#endregion

#region Destroy If Tracked
if ((isTrackable) and (!trackCheck))
{
	scr_StageEntityTracker_Check();
	
	trackCheck = true;
}
#endregion