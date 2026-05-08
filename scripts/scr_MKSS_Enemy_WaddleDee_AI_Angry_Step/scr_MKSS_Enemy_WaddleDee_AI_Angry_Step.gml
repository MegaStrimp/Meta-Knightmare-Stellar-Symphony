///@description MKSS - Enemy - Waddle Dee - AI - Angry - Step

function scr_MKSS_Enemy_WaddleDee_AI_Angry_Step()
{
	if (!localPause)
	{
		var hasFriction = false;
		
		if (isThrown)
		{
			hasFriction = true;
			
			#region Thrown Timer
			if (thrownTimer != -1)
			{
				thrownTimer = max(thrownTimer - speedMultFinal,0);
				if ((thrownTimer == 0) or (hasKnockback))
				{
					isThrown = false;
					knockbackResistance = knockbackResistanceOld;
					
					thrownTimer = -1;
				}
			}
			else
			{
				sprite_index = spriteSet.sprAttack;
				
				if (grounded)
				{
					scr_PlaySfx(snd_MKSS_Squeak);
					var parAngle = irandom_range(0,359);
					var parScaleDir = 1;
					if ((parAngle > 90) and (parAngle <= 270))
					{
						parScaleDir = -1;
					}
					
					scr_MKSS_ParticleSet_FallDuck(x,y,parScaleDir,parAngle);
					
					sprite_index = spriteSet.sprAttackEnd;
					image_index = 0;
					
					knockbackResistance = knockbackResistanceOld;
					
					thrownTimer = thrownTimerMax;
				}
			}
			#endregion
		}
		else if (!isHeld)
		{
			if (!hasKnockback)
			{
				if ((hp > 0) and (attackState == 0))
				{
					#region Movement
					scr_Component_BasicHorizontal_Step(true);
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
				
				#region Stop Attack If Hurt
				attackState = 0;
				attackTimer = attackTimerMax2;
				#endregion
				
				#region Revert Back
				if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded)) knockbackTimer = knockbackTimerMax;
				#endregion
				#endregion
			}
		}
		
		if (grounded)
		{
			#region Drop To The Ground While Attacking
			if ((attackState == 2) and (sign(vsp) != -1))
			{
				scr_PlaySfx(snd_MKSS_Squeak);
				var parAngle = irandom_range(0,359);
				var parScaleDir = 1;
				if ((parAngle > 90) and (parAngle <= 270))
				{
					parScaleDir = -1;
				}
				
				scr_MKSS_ParticleSet_FallDuck(x,y,parScaleDir,parAngle);
				
				attackState = 3;
				
				image_index = 0;
				
				attackTimer = attackTimerMax2;
			}
			#endregion
		}
		else
		{
			#region Stop Attack If Not Grounded
			if (attackState == 1)
			{
				attackState = 0;
				attackTimer = attackTimerMax2;
			}
			#endregion
		}
		
		if (!isHeld)
		{
			#region Friction
			if ((hasFriction) and (grounded))
			{
				var decelFinal = decel * speedMultFinal;
				if (isThrown) decelFinal = decelThrown * speedMultFinal;
				
				hsp = scr_Entity_Friction(hsp,decelFinal);
			}
			#endregion
			
			#region Gravity
			vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
			#endregion
			
			#region Collision
			scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
			#endregion
		}
		
		#region Attack Timer
		if ((attackTimer != -1) and (!isThrown) and (!isHeld))
		{
			attackTimer = max(attackTimer - speedMultFinal,0);
			if (attackTimer == 0)
			{
				var nearestPlayer = instance_nearest(x,y,obj_Player);
				
				if ((((attackState == 0) and (distance_to_object(nearestPlayer) <= attack_Jump_Range)) or (attackState != 0)) and (grounded)) attackState += 1;
				switch (attackState)
				{
					case 1:
					image_index = 0;
					
					hsp = 0;
					
					if (nearestPlayer.x < x)
					{
						dirX = -1;
					}
					else
					{
						dirX = 1;
					}
					
					attackTimer = attackTimerMax1;
					break;
					
					case 2:
					image_index = 0;
					
					hsp = attack_Jump_Movespeed * dirX;
					vsp = -attack_Jump_Jumpspeed;
					
					attackTimer = -1;
					break;
					
					case 4:
					image_index = 0;
					
					attackTimer = attackTimerMax2;
					break;
					
					case 5:
					attackState = 0;
					
					attackTimer = attackTimerMax2;
					break;
				}
			}
		}
		#endregion
		
		#region Animation
		if (isHeld)
		{
			sprite_index = spriteSet.sprHurt1;
		}
		else
		{
			if ((hurtTimer == -1) and (hp > 0))
			{
				if (!isThrown)
				{
					switch (attackState)
					{
						case 0:
						sprite_index = spriteSet.sprWalk;
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
						
						case 4:
						sprite_index = spriteSet.sprTired;
						break;
					}
				}
			}
			else
			{
				sprite_index = sprHurt[hurtFrame][0];
			}
		}
		#endregion
	}
}