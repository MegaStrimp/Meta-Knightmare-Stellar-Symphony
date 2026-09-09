///@description MKSS - Attack - Andromeda 1 - Star Shot - Step

function scr_MKSS_Attack_Andromeda1_StarShot_Step()
{
	if (!localPause)
	{
		#region Position
		rotateAngle = (rotateAngle + (rotateSpd * -sign(hsp) * speedMultFinal)) % 360;
		rotateAngleBack = (rotateAngleBack + (rotateSpdBack * -sign(hsp) * speedMultFinal)) % 360;
		
		hsp = lengthdir_x(spd,angle);
		vsp = lengthdir_y(spd,angle);
		
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}