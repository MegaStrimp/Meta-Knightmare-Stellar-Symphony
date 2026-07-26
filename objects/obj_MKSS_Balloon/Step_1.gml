///@description Begin Step

#region Variables
localPause = (global.pauseFinal) or (localFreezeFrameTimer != -1);
speedMultFinal = global.speedMultGlobal * global.speedMultEnvironment * global.deltaTime;
#endregion

#region Destroy Outside View
if ((destroyOutsideView) and (scr_Entity_OutsideView(32))) instance_destroy();
#endregion

#region Destroy If Tracked
if (!trackCheck)
{
	scr_StageEntityTracker_Check();
	
	trackCheck = true;
}
#endregion