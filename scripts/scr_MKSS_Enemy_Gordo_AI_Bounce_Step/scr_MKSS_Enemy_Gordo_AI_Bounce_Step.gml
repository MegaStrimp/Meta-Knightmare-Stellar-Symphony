///@description MKSS - Enemy - Gordo - AI - Bounce - Step

function scr_MKSS_Enemy_Gordo_AI_Bounce_Step()
{
	if (!localPause)
	{
		if (!isHeld)
		{
			#region Gravity
			vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
			#endregion
			
			#region Friction
			if (grounded)
			{
				var decelFinal = decel * speedMultFinal;
				
				hsp = scr_Entity_Friction(hsp,decelFinal);
			}
			#endregion
			
			if (jumpCount < jumpCountMax)
			{
				#region Jump Timer
				if ((jumpTimer != -1) and (grounded))
				{
					jumpTimer = max(jumpTimer - speedMultFinal,0);
					if (jumpTimer == 0)
					{
						jumpCount += 1;
						
						vsp = -jumpspeed * dirY * speedMultFinal;
						grounded = false;
						jumpspeed = max(1,jumpspeed / jumpCountMax);
						
						jumpTimer = jumpTimerMax;
					}
				}
				#endregion
			
				#region Collision
				scr_Entity_Collision();
				#endregion
			}
			else
			{
				#region Position
				scr_Component_SetPosition(hsp,vsp);
				#endregion
			}
		}
		
		#region Animation
		sprite_index = spriteSet.sprMove;
		#endregion
	}
}