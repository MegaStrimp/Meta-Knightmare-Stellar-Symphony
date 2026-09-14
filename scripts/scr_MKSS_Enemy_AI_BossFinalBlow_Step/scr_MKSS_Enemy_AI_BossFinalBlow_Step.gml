///@description MKSS - Enemy - AI - Boss Final Blow - Step

function scr_MKSS_Enemy_AI_BossFinalBlow_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		canBeHit = false;
		
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