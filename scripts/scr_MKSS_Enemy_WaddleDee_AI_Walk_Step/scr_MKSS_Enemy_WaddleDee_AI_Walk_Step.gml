///@description MKSS - Enemy - Waddle Dee - AI - Walk - Step

function scr_MKSS_Enemy_WaddleDee_AI_Walk_Step()
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
					sprite_index = spriteSet.sprWalk;
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