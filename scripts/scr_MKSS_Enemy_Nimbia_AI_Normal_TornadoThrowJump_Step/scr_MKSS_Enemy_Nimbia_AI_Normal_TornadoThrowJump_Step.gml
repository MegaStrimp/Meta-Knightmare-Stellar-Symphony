///@description MKSS - Enemy - Nimbia - AI - Normal - Tornado Throw Jump - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_TornadoThrowJump_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Tornado Throw Jump";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Jump Prepare Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Jump Timer
		attackStateTimerMax[i] = 8;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Throw Prepare Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Throw Timer
		attackStateTimerMax[i] = 3000;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Catch Timer
		attackStateTimerMax[i] = 3000;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Down Thrust Prepare Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Down Thrust Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Tornado Throw Jump Variables
		hasGravity = false;
		
		swordId = -1;
		swordImpact = false;
		
		pullSpeed = 0;
		pullSpeedAccel = .25;
		pullSpeedMax = 8;
		#endregion
		
		#region Tornado Throw Jump Start
		sprite_index = spriteSet.sprDuck;
		image_index = 0;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decel * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Prepare to Jump
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				dirX = scr_MKSS_Enemy_DirTarget();
				
				sprite_index = spriteSet.sprJump;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Jump
			case 1:
			hsp = -2 * dirX;
			vsp = -5.5;
				
			if (attackStateTimer[attackState] == -1)
			{
				dirX = scr_MKSS_Enemy_DirTarget();
				
				if ((dirX == -1) and (x <= room_width/2)) or ((dirX == 1) and (x > room_width/2))
				{
					sprite_index = spriteSet.sprDownThrust1;
					image_index = 0;
					
					attackState = 6;
				}
				else
				{
					sprite_index = spriteSet.sprThrustPrepare3;
					image_index = 0;
				
					attackState++;
				}
			}
			#endregion
			
			#region Throw Prepare
			case 2:
			hsp = scr_Entity_Friction(hsp,decelSlash * speedMultFinal);
			vsp = scr_Entity_Friction(vsp,decelSlash * speedMultFinal);
			
			if (attackStateTimer[attackState] == -1)
			{
				hsp = 0;
				vsp = 0;
				
				sprite_index = spriteSet.sprSwordThrow2;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Sword Throw
			case 3:
			if (swordId == -1) and (image_index >= 1)
			{
				with (instance_create_depth(x + (37 * dirX),y + 13,depth + 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_Nimbia_SwordThrow;
					mask_index = spr_MKSS_Attack_Nimbia_SwordThrow;
					attackAIStep = scr_MKSS_Attack_Nimbia_SwordThrowAir_Step;
					attackDraw = scr_MKSS_Attack_Nimbia_SwordThrow_Draw;
					other.swordId = id;
					image_angle = 330;
					if (other.dirX == -1)
					{
						image_angle = 210;
						dirY = -1;
					}
					var _spd = 6;
					hsp = lengthdir_x(_spd,image_angle);
					vsp = lengthdir_y(_spd,image_angle);
				}
			}
			
			if (attackStateTimer[attackState] == -1) or (swordImpact)
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Sword Catch
			case 4:
			var _angle = 330;
			if (dirX == -1) _angle = 210;
			
			pullSpeed = min(pullSpeed + (pullSpeedAccel * speedMultFinal),pullSpeedMax);
			
			hsp = lengthdir_x(pullSpeed,_angle);
			vsp = lengthdir_y(pullSpeed,_angle);
			
			if (attackStateTimer[attackState] == -1) or (instance_place(x,y,swordId))
			{
				with (swordId) instance_destroy();
				
				sprite_index = spriteSet.sprSwordCatch2;
				image_index = 0;
				
				vsp = 0;
				
				hasGravity = true;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 5:
			hsp = scr_Entity_Friction(hsp,decelSlash * speedMultFinal);
			
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
			
			#region Down Thrust Prepare
			case 6:
			hsp = scr_Entity_Friction(hsp,decelSlash * speedMultFinal);
			vsp = scr_Entity_Friction(vsp,decelSlash * speedMultFinal);
			
			if (attackStateTimer[attackState] == -1)
			{
				hsp = 0;
				vsp = 5;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Down Thrust Prepare
			case 7:
			if (attackStateTimer[attackState] == -1) or (instance_place(x,y+vsp,obj_Wall))
			{
				hsp = 0;
				vsp = 0;
				
				attackState = 5;
				attackStateTimer[attackState] = 30;
			}
			break;
			#endregion
		}
		#endregion
		
		#region Gravity
		if (hasGravity) vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}