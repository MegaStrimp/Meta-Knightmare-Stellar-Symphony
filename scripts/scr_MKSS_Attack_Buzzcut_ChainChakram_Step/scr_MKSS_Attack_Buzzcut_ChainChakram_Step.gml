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
			with (owner) other.movementAngle = point_direction(xstart,ystart,x,y);
			
			hsp += lengthdir_x(.3,movementAngle);
			vsp += lengthdir_y(.3,movementAngle);
			
			if (distance_to_point(xstart,ystart) <= 1)
			{
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
		
		#region Knockback Angle
		knockbackAngle = movementAngle;
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}