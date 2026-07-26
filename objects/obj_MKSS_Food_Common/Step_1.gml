///@description Begin Step

#region Variables
speedMultFinal = global.speedMultGlobal * global.speedMultEnvironment * speedMult * global.deltaTime;
localPause = global.pauseFinal;
#endregion

#region Destroy If Tracked
if (!trackCheck)
{
	scr_StageEntityTracker_Check();
	
	trackCheck = true;
}
#endregion