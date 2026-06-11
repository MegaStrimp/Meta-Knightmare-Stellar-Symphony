///@description MKSS - Enemy - Rango - AI - Jump and Attack - Swim - Step

function scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Swim_Step()
{
	if (!localPause)
	{
		var hasFriction = true;
		
		if (!hasKnockback)
		{
			if (hp > 0)
			{
				if ((vsp == 0) and (attackState == 0) and (attackTimer == -1))
				{
					scr_Component_BasicHorizontal_Step(true);
					
					var nearestPlayer = instance_nearest(x,y,obj_Player);
					if ((nearestPlayer != noone) and (abs(x - nearestPlayer.x) <= 48))
					{
						sprite_index = spriteSet.sprSpot;
						image_index = 0;
						
						hsp = 0;
						
						attackTimer = attackTimerMax;
					}
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
			
			attackTimer = -1;
			attackState = 0;
			
			#region Revert Back
			if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded)) knockbackTimer = knockbackTimerMax;
			#endregion
			#endregion
		}
		
		#region Friction
		if (hasFriction)
		{
			var decelFinal = decel * speedMultFinal;
			
			hsp = scr_Entity_Friction(hsp,decelFinal);
		}
		#endregion
		
		#region Gravity
		vsp = lerp(vsp,0,.1);
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
					sprite_index = spriteSet.sprAttackReady;
					image_index = 0;
					
					attackTimer = attackTimerMax;
					break;
					
					case 2:
					sprite_index = spriteSet.sprAttack;
					image_index = 0;
					
					attackState = 0;
					
					attackIndex = global.MKSS_AttackIDs[? "rango_Jump"];
					
					script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
					
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
			if (attackTimer == -1)
			{
				sprite_index = spriteSet.sprIdle;
			}
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}