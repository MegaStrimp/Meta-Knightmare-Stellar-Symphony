///@description MKSS - Enemy - Chunky Dee - AI - Normal - Idle - Step

function scr_MKSS_Enemy_ChunkyDee_AI_Normal_Idle_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		if ((isBoss) and (isBossSetup))
		{
			scr_MKSS_Enemy_Miniboss_Setup(playBossTheme);
			scr_MKSS_MarkBoss(id);
			scr_MKSS_Enemy_HealthbarFill_Setup(id);
			
			isBossSetup = false;
		}
		
		attackTimer = attackTimerMax;
		
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
		
		#region Attack Timer
		if (attackTimer != -1)
		{
			attackTimer = max(attackTimer - speedMultFinal,0);
			if (attackTimer == 0)
			{
				if (hasWalked)
				{
					attackIndex = ds_list_find_value(attackList,attackListIndex);
					attackListIndex = (attackListIndex + 1) % ds_list_size(attackList);
				}
				else
				{
					attackIndex = global.MKSS_AttackIDs[? "chunkyDee_Walk"];
				}
				
				hasWalked = !hasWalked;
				
				script_execute(global.MKSS_AttackList[attackIndex].executeAttackScript);
				
				attackTimer = -1;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			sprite_index = spriteSet.sprIdle;
		}
		#endregion
	}
}