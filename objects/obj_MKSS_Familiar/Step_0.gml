///@description Main

if (!localPause)
{
	#region Animation
	image_speed = speedMultFinal;
	
	image_xscale = scale * dirX;
	image_yscale = scale;
	#endregion
}
else
{
	image_speed = 0;
}