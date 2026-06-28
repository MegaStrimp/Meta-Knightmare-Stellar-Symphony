///@description MKSS - Attack - Nimbia - Decoy Cloud - Step

function scr_MKSS_Attack_Nimbia_DecoyCloud_Step()
{
	if (!localPause)
	{
		#region Decoy Cloud Movement
		var _spd = 4 * speedMultFinal;
		if (point_distance(x,y,xTarget,yTarget) <= _spd+1)
		{
			x = xTarget;
			y = yTarget;
		}
		else if (point_distance(x,y,xTarget,yTarget) > _spd) move_towards_point(xTarget,yTarget,_spd);
		#endregion
		
		#region Indicator
		if (strikeReady) and (!eye)
		{
			var _angle = irandom_range(0,359);
			var _spd = random_range(.5,3);
			var _len = irandom_range(12,36);
			scr_MKSS_ParticleSet_LightningBall(x+lengthdir_x(_len,_angle),y+lengthdir_y(_len,_angle),lengthdir_x(_spd,_angle),lengthdir_y(_spd,_angle));
		}
		#endregion
		
		//#region Position
		//scr_Component_SetPosition(hsp,vsp);
		//#endregion
	}
}