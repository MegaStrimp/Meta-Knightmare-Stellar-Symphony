///@description MKSS - Player - Component - Gravity

function scr_MKSS_Player_Component_Gravity()
{
	#region Gravity
	var hasGravity = true;
	if ((hurtState == hurtStates.hurt)
	or (attackStopGravity)) hasGravity = false;
	
	if (hasGravity) vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
	#endregion
}