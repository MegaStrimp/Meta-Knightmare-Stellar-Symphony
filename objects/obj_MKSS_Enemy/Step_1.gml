///@description Begin Step

#region Event Inherited
event_inherited();
#endregion

#region Destroy If Tracked
if (!trackCheck)
{
	scr_StageEntityTracker_Check();
	
	trackCheck = true;
}
#endregion