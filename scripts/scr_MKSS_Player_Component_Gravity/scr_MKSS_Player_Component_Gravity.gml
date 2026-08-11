///@description MKSS - Player - Component - Gravity

function scr_MKSS_Player_Component_Gravity(targetGrav = grav,targetGravLimit = gravLimit,targetSpeedMultFinal = speedMultFinal,isMin = false)
{
	#region Gravity
	var hasGravity = true;
	if ((attackStopGravity)) hasGravity = false;
	
	if (hasGravity)
	{
		var targetVsp = scr_Entity_Gravity(vsp,targetGrav,targetGravLimit,targetSpeedMultFinal)
		if (isMin) targetVsp = min(0,targetVsp);
		
		vsp = targetVsp;
	}
	#endregion
}