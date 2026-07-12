///@description MKSS - Attack - Nimbia - Sword Form - Step

function scr_MKSS_Attack_Nimbia_SwordForm_Step()
{
	if (!localPause)
	{
		#region Prepare to Swing
		if (prepareTimer != -1)
		{
			shake = 2;
			
			prepareTimer = max(prepareTimer - speedMultFinal,0);
			if (prepareTimer == 0)
			{
				swingTimer = swingTimerMax;
				
				prepareTimer = -1;
			}
		}
		else
		{
			#region Swing
			if (swingTimer != -1)
			{
				swingSpeed = min(swingSpeed + (swingSpeedAccel * speedMultFinal),swingSpeedMax);
			
				swingTimer = max(swingTimer - speedMultFinal,0);
				if (swingTimer == 0)
				{
					swingEndTimer = swingEndTimerMax;
				
					swingTimer = -1;
				}
			}
			else
			{
				#region Swing End
				if (swingEndTimer != -1)
				{
					swingSpeed = max(swingSpeed - (swingSpeedDecel * speedMultFinal),0);
			
					swingEndTimer = max(swingEndTimer - speedMultFinal,0);
					if (swingEndTimer == 0)
					{
						swingSpeed = 0;
				
						repeat(32)
						{
							var _len = irandom_range(0,sprite_height);
							var _x = lengthdir_x(_len,(image_angle - 90) % 360) + irandom_range(-8,8);
							var _y = lengthdir_y(_len,(image_angle - 90) % 360) + irandom_range(-8,8);
							scr_MKSS_ParticleSet_NimbiaCloud(x+_x,y+_y,0,0,-1)
						}
				
						image_angle = 0;
				
						repeat(32)
						{
							var _len = irandom_range(0,sprite_height);
							var _x = lengthdir_x(_len,(image_angle - 90) % 360) + irandom_range(-8,8);
							var _y = lengthdir_y(_len,(image_angle - 90) % 360) + irandom_range(-8,8);
							scr_MKSS_ParticleSet_NimbiaCloud(x+_x,y+_y,0,0,-1)
						}
				
						swingEndTimer = -1;
					}
				}
				#endregion
			}
			#endregion
		}
		#endregion
		
		#region Position
		var shakeFinal = random_range(-shake,shake);
		x = owner.x+offsetX+lengthdir_x(-swordLength,(image_angle - 90) % 360)+shakeFinal;
		shakeFinal = random_range(-shake,shake);
		y = owner.y+offsetY+lengthdir_y(-swordLength,(image_angle - 90) % 360)+shakeFinal;
		shake = max(shake - (.1 * speedMultFinal),0);
		image_angle = (image_angle - (swingSpeed * dirX * speedMultFinal)) % 360;
		swordLength = min(swordLength + (swordLengthSpeed * speedMultFinal),swordLengthMax);
		#endregion
	}
}