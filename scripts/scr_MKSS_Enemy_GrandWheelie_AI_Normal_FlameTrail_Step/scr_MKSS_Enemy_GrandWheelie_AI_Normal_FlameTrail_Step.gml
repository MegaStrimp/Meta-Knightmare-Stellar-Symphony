///@description MKSS - Enemy - Grand Wheelie - AI - Normal - Flame Trail - Step

function scr_MKSS_Enemy_GrandWheelie_AI_Normal_FlameTrail_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Grand Wheelie - Big Rush";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Revert Timer
		attackStateTimerMax[i] = 300;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Attack Variables
		fireTimerMax = 45;
		fireTimer = fireTimerMax;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Attack States
		switch (attackState)
		{
			#region Revert
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
		}
		#endregion
		
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
		
		#region Fire Timer
		if (fireTimer != -1)
		{
			fireTimer = max(fireTimer - speedMultFinal,0);
			if (fireTimer == 0)
			{
				#region Attack
				with (instance_create_depth(x,y,depth,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = MKSS_Base_EnemyBasicDamage;
					sprite_index = spr_MKSS_Attack_GrandWheelie_Fire;
					destroyTimer = 150;
					attackAIStep = scr_MKSS_Attack_GrandWheelie_Fire_Step;
				}
				#endregion
				
				fireTimer = fireTimerMax;
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
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}