///@description MKSS - Enemy - Rango - AI - Jump and Attack - Jump - Step

function scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Jump_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		canBeParried = true;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		var hasFriction = false;
		
		if (!hasKnockback)
		{
			if (hp > 0)
			{
				if (particleTimer != -1) and (place_meeting(x,y-18,obj_Water))
				{
					particleTimer = max(particleTimer-speedMultFinal,0);
					if (particleTimer == 0)
					{
						repeat(irandom_range(1,3)) scr_MKSS_ParticleSet_Bubble(x+irandom_range(-6,6),y+irandom_range(-3,3),-dirX);
							
						particleTimer = particleTimerMax;
					}
				}
					
				dirX = 1;
				if (sign(hsp) == -1) dirX = -1;
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
			
			scr_MKSS_Enemy_Rango_AI_Flop_Setup(false);
			scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Rango_AI_Flop_Step);
			canBeParried = false;
			
			#region Revert Back
			if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded)) knockbackTimer = knockbackTimerMax;
			#endregion
			#endregion
		}
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Revert
		if ((sign(vsp) == 1) and (!place_meeting(x,y,obj_Platform)))
		{
			if (grounded)
			{
				scr_MKSS_Enemy_Rango_AI_Flop_Setup(false);
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Rango_AI_Flop_Step);
				canBeParried = false;
			}
			else if (place_meeting(x,y,obj_Water))
			{
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Swim_Step);
				canBeParried = false;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			sprite_index = spriteSet.sprAttack;
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}