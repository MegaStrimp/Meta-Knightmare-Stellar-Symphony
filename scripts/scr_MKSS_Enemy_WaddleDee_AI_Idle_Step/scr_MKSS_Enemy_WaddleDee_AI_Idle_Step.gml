///@description MKSS - Enemy - Waddle Dee - AI - Idle - Step

function scr_MKSS_Enemy_WaddleDee_AI_Idle_Step()
{
	if (!localPause)
	{
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
			sprite_index = targetIdleSprite;
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}