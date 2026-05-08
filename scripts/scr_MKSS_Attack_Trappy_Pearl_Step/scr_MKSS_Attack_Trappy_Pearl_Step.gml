///@description MKSS - Attack - Trappy - Pearl - Step

function scr_MKSS_Attack_Trappy_Pearl_Step()
{
	if (!localPause)
	{
		#region Movement
		hsp = movespeed * dirX * speedMultFinal;
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}