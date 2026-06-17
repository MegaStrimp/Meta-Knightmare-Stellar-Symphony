///@description MKSS - Enemy - Gigant Edge - AI - Normal - Sword Dash - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_SwordDash_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		walkTimerMax = 60;
		walkTimer = walkTimerMax;
		
		readyTimerMax = 20;
		readyTimer = -1;
		
		chargeTimer = -1;
		chargeTimerMax = 180;
		
		revertTimer = -1;
		revertTimerMax = 60;
		
		sprite_index = spriteSet.sprWalk;
		image_index = 0;
		
		swordDash_Accel = .1;
		swordDash_Speed = 0;
		swordDash_SpeedMax = 2.5;
		
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
		
		#region Walk Timer
		if (walkTimer != -1)
		{
			hsp = -.25 * dirX;
		
			walkTimer = max(walkTimer - speedMultFinal,0);
			if (walkTimer == 0)
			{
				hsp = 0;
				
				var nearestPlayer = instance_nearest(x,y,obj_Player);
				
				dirX = 1;
				if (nearestPlayer.x < x) dirX = -1;
				
				sprite_index = spriteSet.sprSwordDash;
				image_index = 0;
				
				readyTimer = readyTimerMax;
				
				walkTimer = -1;
			}
		}
		#endregion
		
		#region Ready Timer
		if (readyTimer != -1)
		{
			readyTimer = max(readyTimer - speedMultFinal,0);
			if (readyTimer == 0)
			{
				hsp = swordDash_Accel * dirX;
				
				chargeTimer = chargeTimerMax;
				
				readyTimer = -1;
			}
		}
		#endregion
		
		#region Charge Timer
		if (chargeTimer != -1)
		{			
			swordDash_Speed = min(swordDash_Speed + (swordDash_Accel * speedMultFinal), swordDash_SpeedMax);
			
			hsp = swordDash_Speed * dirX;
			
			if (instance_place(x + hsp,y,obj_Wall))
			{
				hsp = -2 * dirX;
				vsp = -2;
				
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				revertTimer = revertTimerMax;
				
				chargeTimer = -1;
			}
			
			chargeTimer = max(chargeTimer - speedMultFinal,0);
			if (chargeTimer == 0)
			{
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				revertTimer = revertTimerMax;
				
				chargeTimer = -1;
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