///@description MKSS - Player - Component - Duck Gravity

function scr_MKSS_Player_Component_DuckGravity()
{
	#region Gravity
	vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
	#endregion
}