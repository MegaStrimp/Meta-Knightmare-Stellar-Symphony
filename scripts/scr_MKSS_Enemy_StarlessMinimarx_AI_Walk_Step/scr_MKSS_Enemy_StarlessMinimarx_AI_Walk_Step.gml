///@description MKSS - Enemy - Starless Minimarx - AI - Walk - Step

function scr_MKSS_Enemy_StarlessMinimarx_AI_Walk_Step()
{
	if (!localPause)
	{
		var hasFriction = false;
		
		if (!hasKnockback)
		{
			if (hp > 0)
			{
				#region Movement
				movespeed = min(movespeed + (accel * speedMultFinal),movespeedMax);
				if (!grounded) scr_Component_BasicHorizontal_Step(true);
				#endregion
				
				#region Jump Timer
				if ((jumpTimer != -1) and (grounded))
				{
					jumpTimer = max(jumpTimer - speedMultFinal,0);
					if (jumpTimer == 0)
					{
						jumpspeed = jumpspeed1;
						if (jumpCount == 1) jumpspeed = jumpspeed2;
						jumpCount = (jumpCount + 1) % 2;
						vsp = -jumpspeed * dirY * speedMultFinal;
						grounded = false;
				
						jumpTimer = jumpTimerMax;
					}
				}
				#endregion
				
				#region Laugh Timer
				if (laughTimer != -1)
				{
					laughTimer = max(laughTimer - speedMultFinal,0);
					if (laughTimer == 0)
					{
						var chance = irandom_range(1,laughChance);
						if (chance == laughChance)
						{
							var sfx = scr_PlaySfx(choose(snd_MKSS_Minimarx1,snd_MKSS_Minimarx2,snd_MKSS_Minimarx3,snd_MKSS_Minimarx4));
							audio_sound_pitch(sfx,random_range(.85,1.15));
						}
						
						laughTimer = laughTimerMax + irandom_range(-laughTimerOffset,laughTimerOffset);
					}
				}
				#endregion
			}
			else
			{
				hasFriction = true;
			}
		}
		else
		{
			#region Knockback Active
			hasFriction = true;
			
			#region Revert Back
			if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded)) knockbackTimer = knockbackTimerMax;
			#endregion
			#endregion
		}
		
		#region Friction
		if ((hasFriction) and (grounded))
		{
			var decelFinal = decel * speedMultFinal;
			
			hsp = scr_Entity_Friction(hsp,decelFinal);
		}
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			sprite_index = spriteSet.sprWalk;
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}