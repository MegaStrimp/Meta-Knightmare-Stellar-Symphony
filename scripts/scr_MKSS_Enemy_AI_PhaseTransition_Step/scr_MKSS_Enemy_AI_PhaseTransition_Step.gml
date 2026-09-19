///@description MKSS - Enemy - AI - Stun - Step

function scr_MKSS_Enemy_AI_PhaseTransition_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		revertTimer = 300;
		
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
		
		#region Revert Timer
		if (revertTimer != -1)
		{
			revertTimer = max(revertTimer - speedMultFinal,0);
			if (revertTimer == 0)
			{
				defense = prevDefense;
				knockbackResistance = prevKnockbackResistance;
				flashTimer = -1;
				palIndex = 1;
				
				image_index = 0;
				
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
				
				revertTimer = -1;
			}
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