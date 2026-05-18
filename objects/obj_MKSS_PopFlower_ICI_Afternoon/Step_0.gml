///@description Main

if (!localPause)
{
	#region Animation
	image_speed = speedMultFinal;
	
	if (!active)
	{
		sprite_index = sprClosed;
	}
	#endregion
}
else
{
	image_speed = 0;
}