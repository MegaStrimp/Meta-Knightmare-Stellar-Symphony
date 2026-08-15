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
				if (attackIndex == -1) scr_Component_BasicHorizontal_Step(true);
				
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
			attackState = 0;
			attackIndex = -1;
			attackTimer = -1;
			
			#region Revert Back
			if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded))
			{
				knockbackTimer = knockbackTimerMax;
			}
			
			if (knockbackTimer == 1)
			{
				attackTimer = attackTimerMax;
				dirY = -1;
				upAndDownComponent_TurnTimer = upAndDownComponent_TurnTimerMax;
			}
			#endregion
			#endregion
		}
		
		#region Friction
		if (((hasFriction) and (grounded)) or ((attackIndex != -1)))
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
					
					attackTimer = attackTimerMin;
					break;
					
					case 2:
					#region Attack
					attackIndex = global.MKSS_AttackIDs[? "keke_Throw"];
					
					with (instance_create_depth(x - 6,y + 4,depth - 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = true;
						dmg = MKSS_Base_EnemyBasicDamage;
						destroyAfterHit = true;
						destroyAfterCollideWall = true;
						destroyAfterCollidePlatform = true;
						attackWallHitParticleIndex = scr_MKSS_ParticleSet_BlockBreak1;
						knockbackForce = 1;
						vsp = 2;
						dirX = other.dirX;
						image_xscale = dirX * scale;
						sprite_index = choose
						(
							spr_MKSS_Attack_Keke_Throw_Brick,
							spr_MKSS_Attack_Keke_Throw_Rock,
							spr_MKSS_Attack_Keke_Throw_Pearl,
							spr_MKSS_Attack_Keke_Throw_StarBlock,
							spr_MKSS_Attack_Keke_Throw_Kine,
							spr_MKSS_Attack_Keke_Throw_Coo,
							spr_MKSS_Attack_Keke_Throw_Rick,
							spr_MKSS_Attack_Keke_Throw_Coal
						);
						attackAIStep = scr_MKSS_Attack_Keke_Throw_Step;
						attackAIEndStep = scr_MKSS_Attack_Keke_Throw_EndStep;
					}
					#endregion
					
					attackTimer = attackTimerMin;
					break;
					
					case 3:
					attackState = 0;
					attackIndex = -1;
					
					attackTimer = attackTimerMax;
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