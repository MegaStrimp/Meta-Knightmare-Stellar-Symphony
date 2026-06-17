///@description MKSS - Enemy - Gigant Edge - AI - Normal - Sword Slam - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_SwordSlam_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		readyTimerMax = 40;
		readyTimer = readyTimerMax;
		
		jumpTimerMax = 300;
		jumpTimer = -1;
		
		slamTimer = -1;
		slamTimerMax = 50;
		
		revertTimer = -1;
		revertTimerMax = 70;
		
		sprite_index = spriteSet.sprDuck;
		image_index = 0;
		
		swordSlam_JumpSpeed = 1.25;
		swordSlam_JumpHeight = -6.5;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decel * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Ready Timer
		if (readyTimer != -1)
		{
			readyTimer = max(readyTimer - speedMultFinal,0);
			if (readyTimer == 0)
			{
				var nearestPlayer = instance_nearest(x,y,obj_Player);
				
				dirX = 1;
				if (nearestPlayer.x < x) dirX = -1;
				
				sprite_index = spriteSet.sprSwordSlam;
				image_index = 0;
				
				hsp = swordSlam_JumpSpeed * dirX;
				vsp = swordSlam_JumpHeight;
				
				jumpTimer = jumpTimerMax;
				slamTimer = slamTimerMax;
				
				readyTimer = -1;
			}
		}
		#endregion
		
		#region Jump Timer
		if (jumpTimer != -1)
		{
			hsp = swordSlam_JumpSpeed * dirX;
			
			if (slamTimer != -1)
			{
				vsp = scr_Entity_Friction(vsp,grav * speedMultFinal);
				
				slamTimer = max(slamTimer - speedMultFinal,0);
				if (slamTimer == 0)
				{
					slamTimer = -1;
				}
			}
			
			if (grounded) and (jumpTimer != jumpTimerMax)
			{
				hsp = 0;
				vsp = 0;
				
				revertTimer = revertTimerMax;
				
				jumpTimer = -1;
			}
			
			jumpTimer = max(jumpTimer - speedMultFinal,0);
			if (jumpTimer == 0)
			{
				revertTimer = revertTimerMax;
				
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
				
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_GigantEdge_AI_Normal_Idle_Step);
				
				revertTimer = -1;
			}
		}
		#endregion
	}
}