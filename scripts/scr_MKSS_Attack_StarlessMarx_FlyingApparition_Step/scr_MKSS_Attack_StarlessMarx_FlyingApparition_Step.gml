///@description MKSS - Attack - Starless Marx - Flying Apparition - Step

function scr_MKSS_Attack_StarlessMarx_FlyingApparition_Step()
{
	if (!localPause)
	{
		#region Movement
		hsp = lerp(hsp,16 * dirX * speedMultFinal,.1 * speedMultFinal);
		vsp = lerp(vsp,-12 * speedMultFinal,.05 * speedMultFinal);
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}