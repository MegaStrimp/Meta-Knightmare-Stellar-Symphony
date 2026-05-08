///@description MKSS - Enemy - Rango - AI - Jump and Attack - Step

function scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Step()
{
	if (!localPause)
	{
		var hasFriction = false;
		
		if (!hasKnockback)
		{
			if (hp > 0)
			{
				switch (attackState)
				{
					default:
					hasFriction = true;
					break;
					
					case 0:
					hasFriction = true;
					
					#region Notice Player
					var nearestPlayer = instance_nearest(x,y,obj_Player);
					if (distance_to_object(nearestPlayer) <= 96)
					{
						dirX = 1;
						if (nearestPlayer.x < x) dirX = -1;
						
						attackTimer = 0;
					}
					#endregion
					break;
					
					case 2:
					#region Movement
					scr_Component_BasicHorizontal_Step(true);
					#endregion
					
					#region Revert
					var nearestPlayer = instance_nearest(x,y,obj_Player);
					if ((sign(nearestPlayer.x - x) == dirX) and (distance_to_object(nearestPlayer) <= 96))
					{
						revertTimer = max(floor(revertTimerMax / 2),revertTimer);
					}
					#endregion
					break;
				}
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
					
					sprite_index = spriteSet.sprAttackStart;
					image_index = 0;
					
					attackTimer = attackTimerMax;
					break;
					
					case 2:
					image_index = 0;
					
					attackIndex = global.MKSS_AttackIDs[? "rango_Claw"];
					
					script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
					
					attackTimer = -1;
					revertTimer = revertTimerMax;
					break;
				}
			}
		}
		#endregion
		
		#region Revert Timer
		if (revertTimer != -1)
		{
			revertTimer = max(revertTimer - speedMultFinal,0);
			if (revertTimer == 0)
			{
				attackIndex = -1;
				attackState = 0;
				attackTimer = -1;
				
				revertTimer = -1;
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
				case 0:
				if (hsp == 0)
				{
					sprite_index = spriteSet.sprIdle;
				}
				else
				{
					sprite_index = spriteSet.sprJump;
				}
				break;
				
				case 1:
				sprite_index = spriteSet.sprAttackStart;
				break;
				
				case 2:
				sprite_index = spriteSet.sprAttack;
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