///@description Main

#region Event Inherited
event_inherited();
#endregion

if (!localPause)
{
	#region Variables
	var isOpen = (y <= ystart - yLimit);
	#endregion
	
	#region Activate With Switch
	with (obj_MKSS_Switch)
	{
		if ((switchNetworkNum == other.switchNetworkNum) and (flag_SwitchActive)) other.active = !other.active;
	}
	#endregion
	
	#region Movement
	if (active)
	{
		if (y > ystart - yLimit)
		{
			y -= 2;
		}
	}
	else
	{
		if (y < ystart)
		{
			y += 2;
		}
	}
	
	y = clamp(y,ystart - yLimit,ystart);
	#endregion
	
	#region Animation
	image_index = isOpen;
	#endregion
}