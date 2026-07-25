///@description MKSS - Enemy - Wheelie - AI - Walk and Attack - Step

function scr_MKSS_Enemy_Wheelie_AI_WalkAndAttack_Step()
{
	if (!localPause)
	{
		var hasFriction = false;
		
		if (!hasKnockback)
		{
			if (hp > 0)
			{
				#region Notice Player
				if (attackState == 0)
				{
					var nearestPlayer = instance_nearest(x,y,obj_Player);
					if (distance_to_object(nearestPlayer) <= 48)
					{
						dirX = 1;
						if (nearestPlayer.x < x) dirX = -1;
						
						hsp = 0;
						
						attackTimer = 0;
					}
				}
				#endregion
				
				#region Movement
				movespeed = movespeedBase * (1 + (isCharging * chargeMult)) * speedMultFinal;
				accel = accelBase * (1 + (isCharging * chargeMult)) * speedMultFinal;
				
				if (attackState != 1) scr_Component_WalkAndTurn_Step();
				#endregion
				
				#region Wall Detection
				if ((!isTurning) and (place_meeting(x + (dirX * floor(global.gameTileSize / 2)),y,obj_Wall)))
				{
					dirX *= -1;
					isTurning = true;
					
					revertTimer = 0;
					
					sprite_index = spriteSet.sprTurn;
					image_index = 0;
				}
				#endregion
				
				#region Afterimage
				var hasAfterimage = (isCharging);
				
				if ((afterimageTimer == -1) and (hasAfterimage)) afterimageTimer = afterimageTimerMax;
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
			
			isTurning = false;
			isCharging = false;
			
			attackState = 0;
			attackTimer = -1;
			
			revertTimer = -1;
			
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
					
					attackTimer = attackTimerMax;
					break;
					
					case 2:
					attackIndex = global.MKSS_AttackIDs[? "wheelie_Charge"];
					isCharging = true;
					
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
				isCharging = false;
				attackTimer = -1;
				
				revertTimer = -1;
			}
		}
		#endregion
		
		#region Afterimage Timer
		if (afterimageTimer != -1)
		{
			afterimageTimer = max(afterimageTimer - speedMultFinal,0);
			if (afterimageTimer == 0)
			{
				scr_MKSS_ParticleSet_Afterimage();
				
				afterimageTimer = -1;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			if (isTurning)
			{
				sprite_index = spriteSet.sprTurn;
			}
			else
			{
				sprite_index = spriteSet.sprWalk;
			}
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}