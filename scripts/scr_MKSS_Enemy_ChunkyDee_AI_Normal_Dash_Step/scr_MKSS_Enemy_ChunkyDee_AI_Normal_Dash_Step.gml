///@description MKSS - Enemy - Chunky Dee - AI - Normal - Dash - Step

function scr_MKSS_Enemy_ChunkyDee_AI_Normal_Dash_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Component Setup
		scr_Component_BasicHorizontal_Setup(2);
		#endregion
		
		readyTimer = 90;
		
		dashPoundTimer = -1;
		dashPoundTimerMax = 15;
		
		dashParticleTimer = -1;
		dashParticleTimerMax = 45;
		
		dashEndTimer = -1;
		dashEndTimerMax = 60;
		
		isTired = false;
		revertTimer = -1;
		revertTimerMax = 90;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		if ((readyTimer == -1) and (!isTired)) scr_Component_BasicHorizontal_Step(true);
		#endregion
		
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
		
		#region Dash Pound Timer
		if (dashPoundTimer != -1)
		{
			dashPoundTimer = max(dashPoundTimer - speedMultFinal,0);
			if (dashPoundTimer == 0)
			{
				scr_PlaySfx(snd_MKSS_BlockBreak);
				
				scr_Camera_SetScreenshake(0,1);
				
				dashPoundTimer = dashPoundTimerMax;
			}
		}
		#endregion
		
		#region Dash Particle Timer
		if (dashParticleTimer != -1)
		{
			dashParticleTimer = max(dashParticleTimer - speedMultFinal,0);
			if (dashParticleTimer == 0)
			{
				scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
				
				dashParticleTimer = dashParticleTimerMax;
			}
		}
		#endregion
		
		#region Ready Timer
		if (readyTimer != -1)
		{
			readyTimer = max(readyTimer - speedMultFinal,0);
			if (readyTimer == 0)
			{
				dashPoundTimer = 0;
				dashParticleTimer = 0;
				dashEndTimer = dashEndTimerMax;
				
				readyTimer = -1;
			}
		}
		#endregion
		
		#region Dash End Timer
		if (dashEndTimer != -1)
		{
			dashEndTimer = max(dashEndTimer - speedMultFinal,0);
			if (dashEndTimer == 0)
			{
				scr_PlaySfx(snd_MKSS_RunBegin);
				
				scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
				
				dashPoundTimer = -1;
				dashParticleTimer = -1;
				isTired = true;
				revertTimer = revertTimerMax;
				
				dashEndTimer = -1;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			if (isTired)
			{
				imageSpeed = 1;
				sprite_index = spriteSet.sprDashEnd;
			}
			else
			{
				imageSpeed = lerp(imageSpeed,3,.02);
				sprite_index = spriteSet.sprDash;
			}
		}
		#endregion
		
		#region Revert Timer
		if (revertTimer != -1)
		{
			revertTimer = max(revertTimer - speedMultFinal,0);
			if (revertTimer == 0)
			{
				var nearestPlayer = instance_nearest(x,y,obj_Player);
				
				dirX = 1;
				if (nearestPlayer.x < x) dirX = -1;
				
				imageSpeed = 1;
				
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_ChunkyDee_AI_Normal_Idle_Step);
				
				revertTimer = -1;
			}
		}
		#endregion
	}
}