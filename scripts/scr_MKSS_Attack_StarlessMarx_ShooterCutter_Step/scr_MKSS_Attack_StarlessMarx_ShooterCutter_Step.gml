///@description MKSS - Attack - Starless Marx - Shooter Cutter - Step

function scr_MKSS_Attack_StarlessMarx_ShooterCutter_Step()
{
	if (!localPause)
	{
		#region Decel Timer
		if (decelTimer != -1)
		{
			decelTimer = max(decelTimer - speedMultFinal,0);
			if (decelTimer == 0)
			{
				decelTimer = -1;
			}
		}
		#endregion
		
		#region Movement
		if (decelTimer == -1)
		{
			with (owner) other.movementAngle = point_direction(other.x,other.y,x,y);
			
			hsp += lengthdir_x(.3,movementAngle);
			vsp += lengthdir_y(.3,movementAngle);
			
			if (distance_to_point(owner.x,owner.y) <= 1)
			{
				var count = 0;
				with (obj_Attack)
				{
					if (owner == other.owner)
					{
						count += 1;
						if (count > 1) break;
					}
				}
				
				if (count <= 1)
				{
					with (owner)
					{
						shooterCutter_CancelTimer = shooterCutter_CancelTimerMax;
					}
				}
				
				instance_destroy();
			}
		}
		else
		{
			movementAngle += 20;
			
			hsp += lengthdir_x(.4,movementAngle);
			vsp += lengthdir_y(.4,movementAngle);
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}