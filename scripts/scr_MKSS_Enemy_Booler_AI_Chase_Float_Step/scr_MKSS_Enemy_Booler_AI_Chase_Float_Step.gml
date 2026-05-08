///@description MKSS - Enemy - Booler - AI - Chase - Float - Step

function scr_MKSS_Enemy_Booler_AI_Chase_Float_Step()
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
				with (obj_Player)
				{
					other.drawDirX = sign(x - other.x);
					if (other.drawDirX == 0) other.drawDirX = 1;
					
					if (x <= other.x - 64)
					{
						other.dirX = -1;
					}
					else if (x >= other.x + 64)
					{
						other.dirX = 1;
					}
					
					var yDistance = y - other.y;
					
					if (abs(yDistance) > 16)
					{
						other.dirY = sign(yDistance);
					}
				}
				
				scr_Component_WalkAndTurn_Step();
				
				scr_Component_UpAndDown_Step();
				#endregion
			}
			else
			{
				hasFriction = true;
				hasGravity = true;
			}
		}
		else
		{
			#region Knockback Active
			hasFriction = true;
			
			#region Revert Back
			if ((knockbackTimer == -1) and (knockbackCheckTimer == -1))
			{
				knockbackTimer = hurtTimer;
			}
			
			if ((knockbackTimer == 1) and (hp > 0))
			{
				scr_PlaySfx(snd_MKSS_Ghost);
				
				hsp = 0;
				vsp = 0;
				
				dirY = choose(-1,1);
				upAndDownComponent_TurnTimer = upAndDownComponent_TurnTimerMax;
				
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Booler_AI_Chase_Mist_Step);
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
		
		if (hp > 0)
		{
			#region Position
			scr_Component_SetPosition(hsp,vsp);
			#endregion
		}
		else
		{
			#region Collision
			scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
			#endregion
		}
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			sprite_index = spriteSet.sprIdle;
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}