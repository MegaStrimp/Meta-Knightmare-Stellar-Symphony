///@description MKSS - Player - Component - Duck Movement

function scr_MKSS_Player_Component_DuckMovement()
{
	#region Change Direction
	if (input_check("right",playerNum))
	{
		dirX = 1;
	}
	
	if (input_check("left",playerNum))
	{
		dirX = -1;
	}
	#endregion
	
	#region Decelerate
	var decelFinal = decel * 2 * speedMultFinal;
	
	hsp = scr_Entity_Friction(hsp,decelFinal);
	#endregion
	
	#region Speed Limit
	var hasSpeedLimit = true;
	if (hurtState == hurtStates.hurt) hasSpeedLimit = false;
	
	if (hasSpeedLimit)
	{
		var maxMovespeed = movespeed * speedMultFinal;
		hsp = clamp(hsp,-maxMovespeed,maxMovespeed);
	}
	#endregion
}