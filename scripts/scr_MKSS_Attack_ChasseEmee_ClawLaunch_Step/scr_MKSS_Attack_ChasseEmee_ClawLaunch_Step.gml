///@description MKSS - Attack - Chasse Emee - Claw Launch - Step

function scr_MKSS_Attack_ChasseEmee_ClawLaunch_Step()
{
	if (!localPause)
	{
		#region Clamp
		if (hsp <= 1) and (launch)
		{
			if (clampTimer != -1)
			{
				image_index = 1;
				
				shake = 1.5;
				
				clampTimer = max(clampTimer - speedMultFinal,0);
				if (clampTimer == 0)
				{
					sprite_index = spr_MKSS_Attack_ChasseEmee_ClawClosed;
					mask_index = spr_MKSS_Attack_ChasseEmee_ClawClosed;
					image_index = 0;
					
					with (instance_create_depth(x + (32 * dirX),y,depth - 4,obj_MKSS_Attack))
					{
						owner = other.owner;
						isEnemy = true;
						dmg = 1;
						sprite_index = spr_MKSS_Attack_ChasseEmee_ClawImpact;
						mask_index = spr_MKSS_Attack_ChasseEmee_ClawImpact;
						destroyAfterAnimation = true;
						dirX = other.dirX;
						image_xscale = dirX;
					}
		
					clampTimer = -1;
				}
			}
		}
		
		if (clampTimer == -1)
		{
			shake = max(shake - (.1 * speedMultFinal),0);
			
			postClampTimer = max(postClampTimer - speedMultFinal,0);
			if (postClampTimer == 0)
			{
				shake = 0;
				
				postClampTimer = -1;
			}
		}
		#endregion
		
		#region Position
		var _shakeX = random_range(-shake,shake);
		var _shakeY = random_range(-shake,shake);
		
		x = owner.x + (armX * dirX) + _shakeX;
		y = owner.y + armY + _shakeY;
		
		armX += hsp * speedMultFinal;
		armY += vsp * speedMultFinal;
		
		if (postClampTimer != -1)
		{
			hsp = scr_Entity_Friction(hsp,decel * speedMultFinal);
			vsp = scr_Entity_Friction(vsp,decel * speedMultFinal);
			
			scr_Debug_WriteLog(string(hsp));
		}
		else
		{
			hsp = max(hsp - (decel * speedMultFinal),-decelMax);
			
			if (armX <= armXMin) instance_destroy();
		}
		
		armX = clamp(armX,armXMin,armXMax);
		#endregion
	}
}