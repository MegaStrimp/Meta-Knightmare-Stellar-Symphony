///@description MKSS - Enemy - Mr Sandbag - AI - Stand - Step

function scr_MKSS_Enemy_MrSandbag_AI_Stand_Step()
{
	#region Give HP Back
	hp = maxHp;
	#endregion
	
	if (!localPause)
	{
		var hasFriction = true;
		
		if (hasKnockback)
		{
			#region Knockback Active
			#region Revert Back
			if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded)) knockbackTimer = knockbackTimerMax;
			#endregion
			#endregion
		}
		
		#region Friction
		if ((hasFriction) and (grounded))
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
			sprite_index = sprIdle;
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}