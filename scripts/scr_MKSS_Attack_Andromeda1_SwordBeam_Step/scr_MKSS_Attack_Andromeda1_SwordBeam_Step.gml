///@description MKSS - Attack - Andromeda 1 - Sword Beam - Step

function scr_MKSS_Attack_Andromeda1_SwordBeam_Step()
{
	if (!localPause)
	{
		#region Position
		hsp = lengthdir_x(spd,angle);
		vsp = lengthdir_y(spd,angle);
		
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}