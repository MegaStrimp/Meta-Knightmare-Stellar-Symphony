///@description MKSS - Enemy - Gigant Edge - AI - Normal - Sword Swing - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_SwordSwing_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		readyTimerMax = 45;
		readyTimer = readyTimerMax;
		
		revertTimer = -1;
		revertTimerMax = 70;
		
		sprite_index = spriteSet.sprSwordSwingPrepare;
		image_index = 0;
		
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
				//var nearestPlayer = instance_nearest(x,y,obj_Player);
				
				//dirX = 1;
				//if (nearestPlayer.x < x) dirX = -1;
				
				sprite_index = spriteSet.sprSwordSwing;
				scr_PlaySfx(snd_MKSS_Throw);
				image_index = 0;
				
				revertTimer = revertTimerMax
				
				readyTimer = -1;
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