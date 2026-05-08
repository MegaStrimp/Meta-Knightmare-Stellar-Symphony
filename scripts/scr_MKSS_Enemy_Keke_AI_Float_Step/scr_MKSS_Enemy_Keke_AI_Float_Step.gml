///@description MKSS - Enemy - Keke - AI - Float - Step

function scr_MKSS_Enemy_Keke_AI_Float_Step()
{
	if (!localPause)
	{
		var hasFriction = false;
		var hasGravity = false;
		
		if (!hasKnockback)
		{
			if (hp > 0)
			{
				#region Movement
				scr_Component_BasicHorizontal_Step();
				
				scr_Component_UpAndDown_Step();
				#endregion
			}
			else
			{
				hasFriction = true;
			}
		}
		else
		{
			#region Knockback Active
			hasFriction = true;
			hasGravity = true;
			dirY = 1;
			
			#region Revert Back
			if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded))
			{
				knockbackTimer = knockbackTimerMax;
			}
			
			if (knockbackTimer == 1)
			{
				dirY = -1;
				upAndDownComponent_TurnTimer = upAndDownComponent_TurnTimerMax;
			}
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
		if (hasGravity) vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			sprite_index = spriteSet.sprFloat;
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}