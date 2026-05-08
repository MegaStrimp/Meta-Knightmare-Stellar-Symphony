///@description MKSS - Enemy - Rango - AI - Flop - Step

function scr_MKSS_Enemy_Rango_AI_Flop_Step()
{
	if (!localPause)
	{
		if (!hasKnockback)
		{
			if (hp > 0)
			{
				#region Movement
				if (!grounded) scr_Component_BasicHorizontal_Step(true);
				#endregion
				
				#region Flop Timer
				if (flopTimer != -1)
				{
					flopTimer = max(flopTimer - speedMultFinal,0);
					if (flopTimer == 0)
					{
						scr_PlaySfx(snd_MKSS_EnemyJump);
						
						var angle = 90 + (20 * dirX);
						scr_MKSS_ParticleSet_Jump(x - (7 * dirX),y,angle);
						
						jumpCount += 1;
						
						var jumpspeedFinal = jumpspeedMin;
						if (jumpCount >= 2)
						{
							jumpspeedFinal = jumpspeedMax;
							jumpCount = 0;
						}
						
						vsp = -jumpspeedFinal * dirY * speedMultFinal;
						grounded = false;
						
						image_index = 0;
						
						flopTimer = flopTimerMax;
					}
				}
				#endregion
			}
		}
		else
		{
			#region Knockback Active
			jumpCount = 0;
			flopTimer = flopTimerMax;
			
			#region Revert Back
			if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded)) knockbackTimer = knockbackTimerMax;
			#endregion
			#endregion
		}
		
		#region Friction
		if (grounded)
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
			if (grounded)
			{
				sprite_index = spriteSet.sprFlop;
			}
			else
			{
				sprite_index = spriteSet.sprFlopJump;
			}
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}