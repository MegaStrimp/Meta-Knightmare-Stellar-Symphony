///@description MKSS - Enemy - Baggie - AI - Run - Step

function scr_MKSS_Enemy_Baggie_AI_Run_Step()
{
	if (!localPause)
	{
		var hasFriction = false;
		
		if (!hasKnockback)
		{
			if (hp > 0)
			{
				if (isEnraged)
				{
					#region Run Begin
					if (runBegin)
					{
						scr_PlaySfx(snd_MKSS_RunBegin);
						
						runParticleNum = 0;
						runParticleTimer = 0;
						
						runBegin = false;
					}
					#endregion
					
					#region Change Direction
					if (canChangeDirection)
					{
						var nearestPlayer = instance_nearest(x,y,obj_Player);
						
						dirX = -1;
						if (nearestPlayer.x < x) dirX = 1;
						
						canChangeDirection = false;
					}
					#endregion
					
					#region Movement
					scr_Component_BasicHorizontal_Step(true);
					#endregion
					
					#region Jump
					if ((grounded) and (place_meeting(x + (24 * dirX),y,obj_Wall)))
					{
						scr_PlaySfx(snd_MKSS_EnemyJump);
						
						var angle = 90 + (20 * dirX);
						scr_MKSS_ParticleSet_Jump(x - (7 * dirX),y + 5,angle);
						
						vsp = -jumpspeed * dirY * speedMultFinal;
						grounded = false;
					}
					#endregion
					
					#region Run Particle Timer
					if (runParticleTimer != -1)
					{
						runParticleTimer = max(runParticleTimer - speedMultFinal,0);
						if (runParticleTimer == 0)
						{
							if (grounded)
							{
								scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
							}
							if (runParticleNum == 0)
							{
								runParticleTimer = runParticleTimerMin;
								runParticleNum += 1;
							}
							else
							{
								runParticleNum = 0;
								runParticleTimer = runParticleTimerMax;
							}
						}
					}
					#endregion
				}
				else
				{
					#region Spot Player
					if ((playerSpotTimer == -1) and (distance_to_object(obj_Player) <= playerSpotRange))
					{
						image_index = 0;
						
						var nearestPlayer = instance_nearest(x,y,obj_Player);
						
						dirX = 1;
						if (nearestPlayer.x < x) dirX = -1;
						
						scr_PlaySfx(snd_MKSS_EnemyJump);
						
						var angle = 90 + (20 * dirX);
						scr_MKSS_ParticleSet_Jump(x - (7 * dirX),y + 5,angle);
						
						vsp = -jumpspeed * dirY * speedMultFinal;
						grounded = false;
						
						playerSpotTimer = playerSpotTimerMax;
					}
					#endregion
				}
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
			
			if (!isEnraged)
			{
				isEnraged = true;
				runBegin = true;
			}
			
			playerSpotTimer = -1;
			canChangeDirection = true;
			
			#region Revert Back
			if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded)) knockbackTimer = knockbackTimerMax;
			#endregion
			#endregion
		}
		
		#region Player Spot Timer
		if (playerSpotTimer != -1)
		{
			shakeX = 1;
			
			playerSpotTimer = max(playerSpotTimer - speedMultFinal,0);
			if (playerSpotTimer == 0)
			{
				var nearestPlayer = instance_nearest(x,y,obj_Player);
				
				dirX = -1;
				if (nearestPlayer.x < x) dirX = 1;
				
				isEnraged = true;
				runBegin = true;
				image_index = 0;
				
				playerSpotTimer = -1;
			}
		}
		#endregion
		
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
			if (isEnraged)
			{
				sprite_index = spriteSet.sprRun;
			}
			else
			{
				if (playerSpotTimer == -1)
				{
					sprite_index = spriteSet.sprIdle;
				}
				else
				{
					sprite_index = spriteSet.sprSpotPlayer;
				}
			}
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}