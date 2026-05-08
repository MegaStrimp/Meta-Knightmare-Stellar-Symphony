///@description MKSS - Enemy - Chunky Dee - AI - Normal - Walk - Step

function scr_MKSS_Enemy_ChunkyDee_AI_Normal_Walk_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Component Setup
		scr_Component_BasicHorizontal_Setup(.5);
		#endregion
		
		revertTimer = 120;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		scr_Component_BasicHorizontal_Step(true);
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
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			sprite_index = spriteSet.sprWalk;
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
				
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_ChunkyDee_AI_Normal_Idle_Step);
				
				revertTimer = -1;
			}
		}
		#endregion
	}
}