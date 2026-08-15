///@description MKSS - Attack - Waddle Doo - Beam - Step

function scr_MKSS_Attack_WaddleDoo_Beam_Step()
{
	if (!localPause)
	{
		#region Movement
		if (instance_exists(owner))
		{
			angle = (angle + spd) % 360;
			
			x = lengthdir_x(orbit,angle) + (owner.x) + (12 * dirX);
			y = lengthdir_y(orbit,angle) + (owner.y) - 1;
		}
		#endregion
		
		#region Pulse Timer
		if (pulseTimer != -1)
		{
			pulseTimer = max(pulseTimer - speedMultFinal,0);
			if (pulseTimer == 0)
			{
				pulseActive = !pulseActive;
				
				pulseTimer = pulseTimerMax;
			}
		}
		#endregion
	}
	
	#region Animation
	if (pulseActive)
	{
		image_index = 0;
	}
	else
	{
		image_index = beamIndex;
	}
	#endregion
}