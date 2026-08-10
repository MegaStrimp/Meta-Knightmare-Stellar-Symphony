///@description MKSS - Player - Component - Gravity

function scr_MKSS_Player_Component_Gravity(targetGrav = grav,targetGravLimit = gravLimit,targetSpeedMultFinal = speedMultFinal)
{
	#region Gravity
	var hasGravity = true;
	if ((attackStopGravity)) hasGravity = false;
	
	if (hasGravity) vsp = scr_Entity_Gravity(vsp,targetGrav,targetGravLimit,targetSpeedMultFinal);
	#endregion
}