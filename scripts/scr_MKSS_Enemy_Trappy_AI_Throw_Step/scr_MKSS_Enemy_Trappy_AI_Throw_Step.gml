///@description MKSS - Enemy - Trappy - AI - Throw - Step

function scr_MKSS_Enemy_Trappy_AI_Throw_Step()
{
	if (!localPause)
	{
		if (!hasKnockback)
		{
			if ((grounded) and (!isHopping) and (!isAttacking))
			{
				#region Quick Attack
				if ((attackTimer <= attackTimerMax / 2) and (distance_to_object(obj_Player) <= 84)) attackTimer = 0;
				#endregion
				
				#region Hop Timer
				if (hopTimer != -1)
				{
					hopTimer = max(hopTimer - speedMultFinal,0);
					if (hopTimer == 0)
					{
						jumpBuffer = true;
						
						isHopping = true;
						
						sprite_index = spriteSet.sprHop;
						image_index = 0;
						
						hopTimer = hopTimerMax;
					}
				}
				#endregion
				
				#region Attack Timer
				if (attackTimer != -1)
				{
					attackTimer = max(attackTimer - speedMultFinal,0);
					if (attackTimer == 0)
					{
						scr_PlaySfx(snd_MKSS_EnemyJump);
						
						var angle = 90 + (20 * dirX);
						scr_MKSS_ParticleSet_Jump(x - (7 * dirX),y + 5,angle);
						
						vsp = -jumpspeed * dirY * speedMultFinal;
						grounded = false;
						
						isAttacking = true;
						
						isHopping = false;
						hopTimer = hopTimerMax;
						
						attackCount = irandom_range(1,3);
						throwTimer = throwTimerMax;
						
						sprite_index = spriteSet.sprThrow;
						image_index = 0;
						
						attackTimer = -1;
					}
				}
				#endregion
			}
			
			#region Jump Buffer
			if ((jumpBuffer) and (image_index >= 3))
			{
				scr_PlaySfx(snd_MKSS_EnemyJump);
				
				var angle = 90 + (20 * dirX);
				scr_MKSS_ParticleSet_Jump(x - (7 * dirX),y + 5,angle);
				
				vsp = -jumpspeed * dirY * speedMultFinal;
				grounded = false;
				
				jumpBuffer = false;
			}
			#endregion
			
			#region Throw Timer
			if (throwTimer != -1)
			{
				throwTimer = max(throwTimer - speedMultFinal,0);
				if (throwTimer == 0)
				{
					if (attackCount > 0)
					{
						attackIndex = global.MKSS_AttackIDs[? "trappy_Pearl"];
						
						script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
						
						attackCount -= 1;
						
						image_index = image_number - 2;
						
						throwTimer = throwTimerMax;
					}
					else
					{
						isAttacking = false;
						
						sprite_index = spriteSet.sprClose;
						image_index = 0;
						
						attackTimer = attackTimerMax;
						throwTimer = -1;
					}
				}
			}
			#endregion
		}
		else
		{
			#region Knockback Active
			isHopping = false;
			hopTimer = hopTimerMax;
			
			isAttacking = false;
			attackTimer = attackTimerMax;
			
			throwTimer = -1;
			
			jumpBuffer = false;
			
			#region Revert Back
			if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded)) knockbackTimer = knockbackTimerMax;
			#endregion
			#endregion
		}
		
		#region Friction
		if (grounded)
		{
			var decelFinal = decel * speedMultFinal;
			
			hsp = scr_Entity_Friction(hsp,decelFinal);
		}
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			if (isHopping)
			{
				sprite_index = spriteSet.sprHop;
			}
			else if (isAttacking)
			{
				sprite_index = spriteSet.sprThrow;
			}
			else if (sprite_index != spriteSet.sprClose)
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