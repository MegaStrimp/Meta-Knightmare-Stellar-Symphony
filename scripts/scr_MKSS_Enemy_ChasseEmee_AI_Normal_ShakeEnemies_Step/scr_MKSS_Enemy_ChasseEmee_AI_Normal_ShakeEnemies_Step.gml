///@description MKSS - Enemy - Chasse Emee - AI - Normal - Shake Enemies - Step

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_ShakeEnemies_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Chasse-Emee - Shake Enemies";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Prepare Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Shake Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 120;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Shake Enemies Variables
		enemyAmount = 2;
		#endregion
		
		#region Shake Enemies Start
		sprite_index = spriteSet.sprShake;
		image_index = 0;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decelFast * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Prepare
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				if (enemyPhase >= 2)
				{
					sprite_index = spriteSet.sprSpitPrepare;
					image_index = 0;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Shake
			case 1:
			if (attackStateTimer[attackState] <= attackStateTimerMax[attackState]-20)
			{
				if (sprite_index != spriteSet.sprSpitPrepare) and (enemyPhase >= 2)
				{
					sprite_index = spriteSet.sprSpitPrepare;
					image_index = 0;
				}
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				var _x = x;
				var _y = y - 36;
				if (enemyPhase >= 2)
				{
					_x = x + (36 * dirX);
					_y = y - 8;
					
					sprite_index = spriteSet.sprSpit;
					image_index = 0;
				}
				var _spd = random_range(2,3.5);
				var _angle = 90 - (20 * dirX) + irandom_range(-10,10);
				var _enemy = irandom_range(0,2);
				switch (_enemy)
				{
					case 0:
					with (instance_create_depth(_x,_y,depth - 3,obj_MKSS_Enemy_Peezer))
					{
						enemyAIStep = scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup;
						
						dirX = other.dirX;
						
						scr_Enemy_ReceiveKnockback(id,_spd,_angle);
					}
					break;
					
					case 1:
					with (instance_create_depth(_x,_y,depth - 3,obj_MKSS_Enemy_Rango))
					{
						enemyAIStep = scr_MKSS_Enemy_Rango_AI_Flop_Setup;
						
						dirX = other.dirX;
						
						scr_Enemy_ReceiveKnockback(id,_spd,_angle);
					}
					break;
					
					case 2:
					with (instance_create_depth(_x,_y,depth - 3,obj_MKSS_Enemy_Trappy))
					{
						enemyAIStep = scr_MKSS_Enemy_Trappy_AI_Throw_Setup;
						
						dirX = other.dirX;
						
						scr_Enemy_ReceiveKnockback(id,_spd,_angle);
					}
					break;
				}
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				enemyAmount--;
				if (enemyAmount <= 0) attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 2:
			if (attackStateTimer[attackState] <= attackStateTimerMax[attackState] - 30) imageSpeed = 0;
			
			if (attackStateTimer[attackState] == -1)
			{
				imageSpeed = 1;
				
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}