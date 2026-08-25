///@description MKSS - Enemy - Bouncy - AI - Walk - Step

function scr_MKSS_Enemy_Bouncy_AI_Walk_Step()
{
	if (!localPause)
	{
		var hasFriction = false;
		
		if (!hasKnockback)
		{
			if (hp > 0)
			{
				#region Movement
				if (!grounded) scr_Component_BasicHorizontal_Step(true);
				#endregion
				
				#region Grounded
				if ((jumpTimer == jumpTimerMax) and (grounded))
				{
					var parAngle = irandom_range(0,359);
					var parScaleDir = 1;
					if ((parAngle > 90) and (parAngle <= 270))
					{
						parScaleDir = -1;
					}
					
					scr_MKSS_ParticleSet_FallDuck(x,y,parScaleDir,parAngle);
					
					hsp = 0;
					image_index = 0;
				}
				#endregion
				
				#region Jump Timer
				if ((jumpTimer != -1) and (grounded))
				{
					jumpTimer = max(jumpTimer - speedMultFinal,0);
					if (jumpTimer == 0)
					{
						if (jumpCount >= jumpCountMax)
						{
							dirX = scr_MKSS_Enemy_DirTarget();
							
							vsp = -jumpspeedSpin * dirY * speedMultFinal;
							
							scr_Component_BasicHorizontal_Setup(movespeedSpin);
							scr_Enemy_ChangeState_Step(id,bouncy_Spin);
							
							jumpCount = 0;
						}
						else
						{
							vsp = -jumpspeed * dirY * speedMultFinal;
							
							jumpCount += 1;
						}
						
						grounded = false;
						
						var sfx = scr_PlaySfx(snd_MKSS_EnemyJump);
						audio_sound_pitch(sfx,random_range(.85,1.15));
						
						var angle = 90 + (20 * dirX);
						scr_MKSS_ParticleSet_Jump(x - (7 * dirX),y + 5,angle);
						
						image_index = 0;
						
						jumpTimer = jumpTimerMax;
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
			
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			if (grounded)
			{
				sprite_index = spriteSet.sprBounceReady;
			}
			else
			{
				sprite_index = spriteSet.sprBounce;
			}
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}