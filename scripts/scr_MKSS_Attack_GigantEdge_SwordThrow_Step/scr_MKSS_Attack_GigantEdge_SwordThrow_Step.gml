///@description MKSS - Attack - Gigant Edge - Sword Throw - Step

function scr_MKSS_Attack_GigantEdge_SwordThrow_Step()
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
			if (instance_exists(owner))
			{
				if (!turnFinish)
				{
					angle += turnSpeed*speedMultFinal*turnDir;
					angle = scr_AngleLoop(angle);
				
					if ((angle >= point_direction(x,y,owner.x,owner.y)-turnSpeed) and (angle <= point_direction(x,y,owner.x,owner.y)+turnSpeed))
					{
						turnFinish = true;
					}
				}
				else
				{
					angle = point_direction(x,y,owner.x,owner.y);
					if (instance_place(x,y,owner)) instance_destroy();
				}
			}
			else
			{
				destroyOutsideRoom = true;
			}
		}
		#endregion
		
		#region Position
		x += hsp;
		y += vsp;
		
		hsp = lengthdir_x(spd,angle) * speedMultFinal;
		vsp = lengthdir_y(spd,angle) * speedMultFinal;
		#endregion
	}
}