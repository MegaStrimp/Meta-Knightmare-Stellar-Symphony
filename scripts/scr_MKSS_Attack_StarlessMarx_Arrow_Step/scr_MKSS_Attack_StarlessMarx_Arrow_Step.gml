///@description MKSS - Attack - Starless Marx - Arrow - Step

function scr_MKSS_Attack_StarlessMarx_Arrow_Step()
{
	if (!localPause)
	{
		#region Arrow
		if (sprite_index == spr_MKSS_Attack_StarlessMarx_Arrow2) and (image_index >= image_number - 1) and (mask_index != sprite_index)
		{
			mask_index = spr_MKSS_Attack_StarlessMarx_Arrow2;
		}
	
		if (accelTimer != -1)
		{
			spd = max(spd - (decel * speedMultFinal),spdMin);
			
			accelTimer = max(accelTimer - speedMultFinal,0);
			if (accelTimer == 0)
			{
				dmg = dmgTarget;
				
				sprite_index = spr_MKSS_Attack_StarlessMarx_Arrow2;
				image_index = 0;
				imageSpeed = 1;
				
				accelTimer = -1;
			}
		}
		else
		{
			spd = clamp(spd + (accel * accelDir * speedMultFinal),-spdMaxReverse,spdMax);
			if (spd <= -spdMaxReverse) accelDir = 1;
			if (spd >= spdMax) destroyOutsideRoom = true;
		}
		#endregion
		
		#region Position
		hsp = lengthdir_x(spd,angle);
		vsp = lengthdir_y(spd,angle);
		
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}