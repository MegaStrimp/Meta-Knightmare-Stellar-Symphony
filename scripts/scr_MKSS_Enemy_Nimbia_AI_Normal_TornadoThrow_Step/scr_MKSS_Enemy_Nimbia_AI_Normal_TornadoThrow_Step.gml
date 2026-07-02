///@description MKSS - Enemy - Nimbia - AI - Normal - Tornado Throw - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_TornadoThrow_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Tornado Throw";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Sword Throw Prepare Timer
		attackStateTimerMax[i] = 45;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Sword Throwing Timer
		attackStateTimerMax[i] = 300;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Tornado Throw Variables
		swordId = -1;
		#endregion
		
		#region Tornado Throw Start
		sprite_index = spriteSet.sprThrustPrepare2;
		image_index = 0;
		
		vsp = -2;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decelSlash * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Jump
			case 0:
			if (!instance_place(x,y-vsp+1,obj_Wall)) hsp = -2 * dirX;
			
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprSwordThrow1;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Sword Catch
			case 1:
			if (swordId == -1) and (image_index >= 1)
			{
				with (instance_create_depth(x + (45 * dirX),y - 11,depth + 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_Nimbia_SwordThrow;
					mask_index = spr_MKSS_Attack_Nimbia_SwordThrow;
					attackAIStep = scr_MKSS_Attack_Nimbia_SwordThrow_Step;
					attackDraw = scr_MKSS_Attack_Nimbia_SwordThrow_Draw;
					other.swordId = id;
					image_angle = 0;
					if (other.dirX == -1)
					{
						image_angle = 180;
						dirY = -1;
					}
					spdMax = 6;
					spd = spdMax;
					decel = .12;
					angle = image_angle;
				}
			}
			
			if (attackStateTimer[attackState] == -1) or (instance_place(x,y,swordId))
			{
				with (swordId) instance_destroy();
				
				sprite_index = spriteSet.sprSwordCatch1;
				image_index = 0;
				
				hsp = -3 * dirX;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 2:
			if (attackStateTimer[attackState] == -1)
			{
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