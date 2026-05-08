///@description MKSS - Enemy - Chunky Dee - AI - Normal - Jump - Step

function scr_MKSS_Enemy_ChunkyDee_AI_Normal_Jump_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Component Setup
		scr_Component_BasicHorizontal_Setup(1);
		#endregion
		
		sprite_index = spriteSet.sprJumpPrepare;
		image_index = 0;
		
		gravityTimer = -1;
		gravityTimerMax = 15;
		
		jumpTimer = 90;
		
		isTired = false;
		revertTimer = -1;
		revertTimerMax = 90;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		if (jumpTimer == -1)
		{
			if (grounded)
			{
				if (revertTimer == -1)
				{
					sprite_index = spriteSet.sprSlam;
					image_index = 0;
					
					scr_PlaySfx(snd_MKSS_BlockBreak);
					
					scr_Camera_SetScreenshake(0,2);
					
					var parAngle = irandom_range(0,359);
					var parScaleDir = 1;
					if ((parAngle > 90) and (parAngle <= 270))
					{
						parScaleDir = -1;
					}
					
					scr_MKSS_ParticleSet_FallDuck(x,y,parScaleDir,parAngle);
					scr_MKSS_ParticleSet_Run(x + 16,y + 16,-1);
					scr_MKSS_ParticleSet_Run(x - 16,y + 16,1);
					
					with (obj_Player)
					{
						if (grounded)
						{
							vsp = -3 * dirY * speedMultFinal;
							
							scr_Camera_SetScreenshake(2,0);
							
							scr_PlaySfx(snd_MKSS_Hurt);
							script_execute_ext(playerGetHit,[id,10]);
							scr_MKSS_Player_GetStunned(id);
						}
					}
					
					with (obj_MKSS_Enemy_WaddleDee)
					{
						if (grounded)
						{
							vsp = random_range(-2,-1) * dirY * speedMultFinal;
							attackState = 0;
							attackTimer = 90;
						}
					}
					
					revertTimer = revertTimerMax;
				}
			}
			else
			{
				scr_Component_BasicHorizontal_Step(true);
			}
		}
		#endregion
		
		#region Friction
		if (grounded)
		{
			var decelFinal = decel * speedMultFinal;
			
			hsp = scr_Entity_Friction(hsp,decelFinal);
		}
		#endregion
		
		#region Gravity Timer
		if (gravityTimer != -1)
		{
			if (vsp >= 0)
			{
				gravityTimer = max(gravityTimer - speedMultFinal,0);
				if (gravityTimer == 0)
				{
					sprite_index = spriteSet.sprFall;
					image_index = 0;
					
					scr_PlaySfx(snd_MKSS_RunBegin);
					
					scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
					
					gravityTimer = -1;
				}
			}
		}
		#endregion
		
		#region Gravity
		if (gravityTimer == -1)
		{
			vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		}
		else
		{
			vsp = min(0,scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal));
		}
		#endregion
		
		#region Jump Timer
		if (jumpTimer != -1)
		{
			jumpTimer = max(jumpTimer - speedMultFinal,0);
			if (jumpTimer == 0)
			{
				scr_PlaySfx(snd_MKSS_EnemyJump);
				
				var angle = 90 + (20 * dirX);
				scr_MKSS_ParticleSet_Jump(x - (7 * dirX),y + 5,angle);
				
				sprite_index = spriteSet.sprJump;
				image_index = 0;
				
				vsp = -jumpspeed * dirY * speedMultFinal;
				grounded = false;
				
				gravityTimer = gravityTimerMax;
				
				jumpTimer = -1;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
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