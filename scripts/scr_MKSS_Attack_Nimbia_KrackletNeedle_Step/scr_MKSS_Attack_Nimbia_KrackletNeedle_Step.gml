///@description MKSS - Attack - Nimbia - Kracklet Needle - Step

function scr_MKSS_Attack_Nimbia_KrackletNeedle_Step()
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