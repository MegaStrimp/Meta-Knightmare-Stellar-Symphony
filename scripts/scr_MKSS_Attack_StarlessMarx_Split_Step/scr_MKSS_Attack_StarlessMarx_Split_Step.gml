///@description MKSS - Attack - Starless Marx - Split - Step

function scr_MKSS_Attack_StarlessMarx_Split_Step()
{
	if (!localPause)
	{
		#region Friction
		hsp = scr_Entity_Friction(hsp,decelX * speedMultFinal);
		vsp = scr_Entity_Friction(vsp,decelY * speedMultFinal);
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}