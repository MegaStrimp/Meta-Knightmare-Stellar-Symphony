///@description MKSS - Attack - Andromeda 1 - Star Slash - Step

function scr_MKSS_Attack_Andromeda1_StarSlash_Step()
{
	if (!localPause)
	{
		switch (slashState)
		{
			case 0:
			indicatorWidth = min(indicatorWidth + (indicatorWidthGain * speedMultFinal),indicatorWidthMax);
			break;
			
			case 1:
			slashWidth = clamp(slashWidth + (slashWidthGain * speedMultFinal * slashDir),0,slashWidthMax);
			if (slashDir == 1) and (slashWidth >= slashWidthMax) 
			{
				slashDir = -1;
			}
			
			gashWidth = min(gashWidth + (gashWidthGain * speedMultFinal),gashWidthMax);
			if (gashWidth >= gashWidthMax)
			{
				textureX = (textureX + textureSpd) % textureWidth;
				textureY = (textureY + textureSpd) % textureHeight;
				
				if (gashEndTimer != -1)
				{
					gashEndTimer = max(gashEndTimer - speedMultFinal,0);
					if (gashEndTimer == 0)
					{
						gashEndTimer = -1;
					}
				}
				else
				{
					slashState++;
				}
			}
			
			var _hurtPlayer = false;
			
			var _angle = (slashAngle - 90) % 360
			var i = -floor(gashWidth/2);
			repeat(gashWidth)
			{
				var _x = x + lengthdir_x(i,_angle);
				var _y = y + lengthdir_y(i,_angle);
				if (collision_line(_x + lengthdir_x(-slashLength,slashAngle),_y + lengthdir_y(-slashLength,slashAngle),_x + lengthdir_x(slashLength,slashAngle),_y + lengthdir_y(slashLength,slashAngle),obj_Player,true,true))
				{
					_hurtPlayer = true
				}
				
				i++;
			}
		
			if (_hurtPlayer)
			{
				with (obj_Player)
				{
					if (hurtState == hurtStates.none)
					{
						scr_PlaySfx(snd_MKSS_Hurt);
						scr_MKSS_Player_GetHit(id,other.dmgTarget);
					}
				}
			}
			break;
			
			case 2:
			gashWidth = max(gashWidth - (gashWidthGain * speedMultFinal),0);
			if (gashWidth <= 0) instance_destroy();
			break;
		}
	}
}