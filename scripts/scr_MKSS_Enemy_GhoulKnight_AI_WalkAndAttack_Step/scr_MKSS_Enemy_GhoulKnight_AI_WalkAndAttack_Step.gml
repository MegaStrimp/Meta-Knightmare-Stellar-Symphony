///@description MKSS - Enemy - Ghoul Knight - AI - Walk and Attack - Step

function scr_MKSS_Enemy_GhoulKnight_AI_WalkAndAttack_Step()
{
	#region Variables
	canHaveKnockback = (hp <= 0);
	#endregion
	
	#region Setup
	if (enemyState_Setup)
	{
		attackTimer = attackTimerMax;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		var hasFriction = false;
		
		//if (!hasKnockback)
		//{
		if (hp > 0)
		{
			#region Movement
			scr_Component_BasicHorizontal_Step(true);
			#endregion
		}
		else
		{
			hasFriction = true;
		}
		//}
		//else
		//{
		//	#region Knockback Active
		//	hasFriction = true;
			
		//	#region Revert Back
		//	if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded)) knockbackTimer = knockbackTimerMax;
		//	#endregion
		//	#endregion
		//}
		
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
		
		#region Attack Timer
		if (attackTimer != -1)
		{
			attackTimer = max(attackTimer - speedMultFinal,0);
			if (attackTimer == 0)
			{
				attackIndex = ds_list_find_value(attackList,attackListIndex);
				attackListIndex = (attackListIndex + 1) % (ds_list_size(attackList));
				
				if (script_exists(attackIndex)) scr_Enemy_ChangeState_Step(id,attackIndex);
				
				attackTimer = -1;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if (hp > 0)
		{
			sprite_index = spriteSet.sprWalk;
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}