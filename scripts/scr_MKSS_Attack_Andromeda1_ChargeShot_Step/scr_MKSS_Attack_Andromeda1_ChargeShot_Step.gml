///@description MKSS - Attack - Andromeda 1 - Charge Shot - Step

function scr_MKSS_Attack_Andromeda1_ChargeShot_Step()
{
	if (!localPause)
	{
		scale = min(scale + (scaleGain * speedMultFinal),scaleMax);
		textureX = (textureX + textureSpd) % textureWidth;
		textureY = (textureY + textureSpd) % textureHeight;
		
		if (shot)
		{
			spd = min(spd + (accel * speedMultFinal),spdMax);
			
			hsp = lengthdir_x(spd,angle);
			vsp = lengthdir_y(spd,angle);
		
			scr_Component_SetPosition(hsp,vsp);
		}
	}
}