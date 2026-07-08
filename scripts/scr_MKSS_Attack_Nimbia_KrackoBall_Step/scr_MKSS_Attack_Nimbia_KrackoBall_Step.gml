///@description MKSS - Attack - Nimbia - Kracko Ball - Step

function scr_MKSS_Attack_Nimbia_KrackoBall_Step()
{
	if (!localPause)
	{
		#region Pre-Shot
		if (!shot)
		{
			x = owner.x;
			y = owner.y-64;
			
			if (growTimer != -1)
			{
				growTimer = max(growTimer - speedMultFinal,0);
				if (growTimer == 0)
				{
					scale = min(scale+growAmount,1);
					
					growTimer = growTimerMax;
					if (scale >= 1) growTimer = -1;
				}
			}
		}
		#endregion
		
		#region Shot
		if (shot)
		{
			spd = min(spd + (accel * speedMultFinal),spdMax);
		}
		#endregion
		
		#region Position		
		hsp = lengthdir_x(spd,angle);
		vsp = lengthdir_y(spd,angle);		
		scr_Component_SetPosition(hsp,vsp);
		
		if (rotateTimer != -1)
		{
			rotateTimer = max(rotateTimer - speedMultFinal,0);
			if (rotateTimer == 0)
			{
				image_angle = (image_angle - (rotateAmount * owner.dirX)) % 360;
				
				rotateTimer = rotateTimerMax;
			}
		}
		#endregion
	}
}