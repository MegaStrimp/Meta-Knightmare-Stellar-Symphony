///@description MKSS - Enemy - Keke - AI - Float and Attack - Step

function scr_MKSS_Enemy_Keke_AI_FloatAndAttack_Step()
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
			attackTimer = -1;
			attackState = 0;
			
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
		
		#region Attack Timer
		if (attackTimer != -1)
		{
			attackTimer = max(attackTimer - speedMultFinal,0);
			if (attackTimer == 0)
			{
				attackState += 1;
				switch (attackState)
				{
					case 1:
					scr_PlaySfx(snd_MKSS_EnemyJump);
					
					attackTimer = attackTimerMax;
					break;
					
					case 2:
					attackIndex = global.MKSS_AttackIDs[? "keke_Throw"];
					
					attackTimer = floor(attackTimerMax / 2);
					break;
					
					case 3:
					attackState = 0;
					attackTimer = -1;
					break;
				}
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			switch (attackState)
			{
				default:
				sprite_index = spriteSet.sprFloat;
				break;
				
				case 1:
				sprite_index = spriteSet.sprAttackReady;
				break;
				
				case 2:
				sprite_index = spriteSet.sprAttack;
				break;
				
				case 3:
				sprite_index = spriteSet.sprAttackEnd;
				break;
			}
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}