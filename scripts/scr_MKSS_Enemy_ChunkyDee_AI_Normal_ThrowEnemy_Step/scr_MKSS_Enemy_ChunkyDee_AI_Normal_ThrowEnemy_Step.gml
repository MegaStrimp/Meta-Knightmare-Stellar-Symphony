///@description MKSS - Enemy - Chunky Dee - AI - Normal - Throw Enemy - Step

function scr_MKSS_Enemy_ChunkyDee_AI_Normal_ThrowEnemy_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		readyTimer = 0;
		readyTimerMax = 45;
		
		revertTimer = -1;
		revertTimerMax = 90;
		
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
				var nearestPlayer = instance_nearest(x,y,obj_Player);
				
				dirX = 1;
				if (nearestPlayer.x < x) dirX = -1;
				
				heldEnemy = instance_create_depth(x,y - 24,depth - 1,ds_list_find_value(thrownEnemyList,0));
				with (heldEnemy)
				{
					owner = id;
					target = other;
					dirX = other.dirX;
					script_execute(ds_list_find_value(other.thrownEnemyStateList,0));
					isHeld = true;
					canBeHit = false;
					
					if (ds_list_find_value(other.thrownEnemyList,0) == obj_MKSS_Enemy_Gordo) scr_MKSS_UI_ParryIndicator_Create(x,y,depth - 1,90,,id)
				}
				
				sprite_index = spriteSet.sprHold;
				
				throwTimer = 90;
				
				readyTimer = -1;
			}
		}
		#endregion
		
		#region Throw Timer
		if (throwTimer != -1)
		{
			throwTimer = max(throwTimer - speedMultFinal,0);
			if (throwTimer == 0)
			{
				sprite_index = spriteSet.sprThrow;
				scr_PlaySfx(snd_MKSS_Throw);
				image_index = 0;
				
				with (heldEnemy)
				{
					var angle = 90 - (irandom_range(30,40) * dirX);
					var force = 3;
					
					if (ds_list_find_value(other.thrownEnemyList,0) == obj_MKSS_Enemy_Gordo)
					{
						angle = 90 - (30 * dirX);
						force = 3;
						parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryChunkyGordo"];
					}
					else
					{
						parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryChunkyWaddleDee"];
					}
					
					hsp = lengthdir_x(force,angle);
					vsp = lengthdir_y(force,angle);
					
					isHeld = false;
					isThrown = true;
					canBeHit = true;
					canBeParried = true;
					knockbackResistanceOld = knockbackResistance;
					knockbackResistance /= 1.2;
					
					heldEnemy = -1;
				}
				
				ds_list_delete(thrownEnemyList,0);
				ds_list_delete(thrownEnemyStateList,0);
				
				if (ds_list_empty(thrownEnemyList))
				{
					revertTimer = revertTimerMax;
				}
				else
				{
					readyTimer = readyTimerMax;
				}
				
				throwTimer = -1;
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
				
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_ChunkyDee_AI_Normal_Idle_Step);
				
				revertTimer = -1;
			}
		}
		#endregion
	}
}