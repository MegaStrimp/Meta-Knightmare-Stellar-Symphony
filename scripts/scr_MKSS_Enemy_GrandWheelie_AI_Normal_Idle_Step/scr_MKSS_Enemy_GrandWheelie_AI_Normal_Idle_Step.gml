///@description MKSS - Enemy - Grand Wheelie - AI - Normal - Idle - Step

function scr_MKSS_Enemy_GrandWheelie_AI_Normal_Idle_Step()
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
		
		dirX = scr_MKSS_Enemy_DirTarget();
		
		sprite_index = spriteSet.sprWalk;
		image_index = 0;
		
		attackTimer = attackTimerMax;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		scr_Component_WalkAndTurn_Step();
		#endregion
		
		#region Wall Detection
		if ((!isTurning) and (position_meeting(x + (dirX * floor(global.gameTileSize / 2)),y - 8,obj_Wall)))
		{
			dirX *= -1;
			isTurning = true;
			
			sprite_index = spriteSet.sprTurn;
			image_index = 0;
		}
		#endregion
		
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
				attackIndex = ds_list_find_value(attackList,attackListIndex);
				attackListIndex = (attackListIndex + 1) % (ds_list_size(attackList));
				
				if (script_exists(attackIndex)) scr_Enemy_ChangeState_Step(id,attackIndex);
				
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
			if (isTurning)
			{
				sprite_index = spriteSet.sprTurn;
			}
			else
			{
				sprite_index = spriteSet.sprWalk;
			}
		}
		#endregion
	}
}