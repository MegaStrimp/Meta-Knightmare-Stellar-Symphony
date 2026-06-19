///@description Main

#region Event Inherited
event_inherited();
#endregion

if (!localPause)
{
	#region Eye
	eyeIndex = (eyeIndex + eyeSpeed) % eyeNumber;
	#endregion
}