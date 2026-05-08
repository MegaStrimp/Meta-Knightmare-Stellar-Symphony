///@description MKSS - Enemy - Chunky Dee - AI - Normal - Stun - Step

function scr_MKSS_Enemy_ChunkyDee_AI_Normal_Stun_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		stunCancelTimer = 300;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decelStun * speedMultFinal;
		
		if (grounded) hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Flash Timer
		if (flashTimer == -1) flashTimer = flashTimerTarget;
		#endregion
		
		#region Revert Back
		if (stunCancelTimer == -1)
		{
			canHaveKnockback = false;
			hasKnockback = false;
			defense = prevDefense;
			knockbackResistance = prevKnockbackResistance;
			flashTimer = -1;
			palIndex = 1;
			
			sprite_index = spriteSet.sprIdle;
			image_index = 0;
			
			scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_ChunkyDee_AI_Normal_Idle_Step);
		}
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		sprite_index = sprHurt[hurtFrame][0];
		#endregion
	}
}