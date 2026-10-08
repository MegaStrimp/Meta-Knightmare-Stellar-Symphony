///@description MKSS - Attack - Buzzcut - Chain Chakram - Step

function scr_MKSS_Attack_Buzzcut_ChainChakram_Step()
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
			returnTurn += (.25 * speedMultFinal);
			
			movementAngle -= clamp(angle_difference(movementAngle,point_direction(x,y,xstart,ystart)),-returnTurn,returnTurn) * speedMultFinal;
			
			spd = min(spd + (.25 * speedMultFinal),spdMax);
			
			if (point_distance(x,y,xstart,ystart) <= (spd + 1))
			{
				instance_destroy();
			}
		}
		else
		{
			movementAngle += (3 * angleDir * speedMultFinal);
			
			spd = max(spd - (.12 * speedMultFinal),.5);
		}
		#endregion
		
		#region Movement
		hsp = lengthdir_x(spd,movementAngle);
		vsp = lengthdir_y(spd,movementAngle);
		#endregion
		
		#region Knockback Angle
		knockbackAngle = movementAngle;
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}