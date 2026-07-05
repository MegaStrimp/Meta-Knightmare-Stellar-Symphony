///@description MKSS - Attack - Nimbia - Sword Throw - Step

function scr_MKSS_Attack_Nimbia_SwordThrow_Step()
{
	if (!localPause)
	{
		#region Sword Catch
		hsp = lengthdir_x(spd,angle);
		vsp = lengthdir_y(spd,angle);
		
		spd = max(spd - (decel * speedMultFinal),-spdMax);
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}