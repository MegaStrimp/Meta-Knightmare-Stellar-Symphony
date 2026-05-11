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
					canHitChunky = false;
					canBeParried = false;
					
					thrownTimer = thrownTimerMax;
				}
			}
			#endregion
			
			#region Attack Back
			if ((canHitChunky) and (instance_exists(target)))
			{
				var deeX = x;
				var deeOwner = owner;
				
				if ((point_distance(x,y,target.x,target.y) <= 8) or (place_meeting(x,y,target)))
				{
					dirX = sign(x - target.x);
					if (dirX == 0) dirX = 1;
					canHitChunky = false;
					
					with (target)
					{
						//scr_MKSS_ParticleSet_Explosion1(x,y); STRIMPTODO smaller explosion
						
						with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
						{
							owner = deeOwner;
							isEnemy = false;
							dmg = 3;
							canBreakBlocks = true;
							canBeFinisher = true;
							isMelee = false;
							freezeFrameForce = 2;
							enemyHurtTimerMult = 1.25;
							dirX = sign(other.x - deeX);
							knockbackAngle = 90 - (dirX * 45);
							knockbackForce = 3;
							destroyTimer = 1;
							mask_index = spr_64x64Mask_MiddleOrigin;
							visible = false;
							attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_Impact;
						}
						
						scr_MKSS_Score_Add(50);
						scr_MKSS_SpawnMetaPoint(2,x,y,depth - 1,other.owner,90);
						
						scr_PlaySfx(snd_MKSS_EnemyHit);
						
						shakeX = 2;
						other.shakeX = 2;
						
						scr_Camera_SetScreenshake(4);
						
						scr_MKSS_Enemy_GetHit(id,deeOwner,5,90 - (45 * sign(x - other.x)),1,other.speedMultFinal);
						scr_MKSS_Enemy_GetHit(other,deeOwner,5,90 - (45 * sign(other.x - x)),1,other.speedMultFinal);
					}
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
		
		if (isHeld)
		{
			var isHeldCancel = false;
			if (!instance_exists(owner)) isHeldCancel = true;
			
			if (isHeldCancel)
			{
				isHeld = false;
				canBeHit = true;
			}
		}
		else
		{
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
	
	show_debug_message(isThrown)
}