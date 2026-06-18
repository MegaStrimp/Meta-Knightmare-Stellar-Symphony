///@description MKSS - Enemy - Gigant Edge - AI - Normal - Sword Throw - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_SwordThrow_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		readyTimerMax = 60;
		readyTimer = readyTimerMax;
		
		throwStartTimer = -1;
		throwStartTimerMax = 12;
		
		throwTimer = -1;
		throwTimerMax = 180;
		
		revertTimer = -1;
		revertTimerMax = 30;
		
		sprite_index = spriteSet.sprSwordThrowPrepare;
		image_index = 0;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decel * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Ready Timer
		if (readyTimer != -1)
		{
			readyTimer = max(readyTimer - speedMultFinal,0);
			if (readyTimer == 0)
			{
				sprite_index = spriteSet.sprSwordThrow;
				scr_PlaySfx(snd_MKSS_Slash2);
				image_index = 0;
				
				throwStartTimer = throwStartTimerMax;
				
				readyTimer = -1;
			}
		}
		#endregion
		
		#region Throw Start Timer
		if (throwStartTimer != -1)
		{
			throwStartTimer = max(throwStartTimer - speedMultFinal,0);
			if (throwStartTimer == 0)
			{
				var targetAngle = 0;
				if (dirX == -1) targetAngle = 180;
				
				with (instance_create_depth(x + (32 * dirX),y,depth + 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					//canBeParried = isParriable;
					//parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryStarlessMarxCutter"];
					dmg = 1;
					knockbackForce = 1;
					hsp = lengthdir_x(2,targetAngle);
					vsp = lengthdir_y(2,targetAngle);
					dirX = 1;
					if (targetAngle == 180) dirX = -1;
					movementAngle = targetAngle + 25;
					image_xscale = dirX * scale;
					sprite_index = spr_MKSS_Attack_GigantEdge_SwordThrow;
					attackAIStep = scr_MKSS_Attack_GigantEdge_SwordThrow_Step;
					decelTimer = 30;
				}
				
				throwTimer = throwTimerMax;
				
				throwStartTimer = -1;
			}
		}
		#endregion
		
		#region Throw Timer
		if (throwTimer != -1)
		{
			throwTimer = max(throwTimer - speedMultFinal,0);
			if (throwTimer == 0)
			{
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				revertTimer = revertTimerMax;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Revert Timer
		if (revertTimer != -1)
		{
			revertTimer = max(revertTimer - speedMultFinal,0);
			if (revertTimer == 0)
			{
				var nearestPlayer = instance_nearest(x,y,obj_Player);
				
				dirX = 1;
				if (nearestPlayer.x < x) dirX = -1;
				
				imageSpeed = 1;
				
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_GigantEdge_AI_Normal_Idle_Step);
				
				revertTimer = -1;
			}
		}
		#endregion
	}
}