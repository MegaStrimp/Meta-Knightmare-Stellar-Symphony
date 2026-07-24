///@description MKSS - Enemy - Chasse Emee - AI - Normal - Thrust Combo - Step

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_ThrustCombo_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Chasse-Emee - Thrust Combo";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Prepare Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Thrust Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Thrust End Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Prepare Cannonball Timer
		attackStateTimerMax[i] = 10;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Cannonball Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Jump Back Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Thrust Combo Variables
		thrustTimes = 3;
		
		arm = -1;
		#endregion
		
		#region Cannonball Bounce Start
		sprite_index = spriteSet.sprThrust1;
		image_index = 0;
		
		with (instance_create_depth(x + (-32 * dirX),y - 8,depth - 1,obj_MKSS_Attack))
		{
			owner = other;
			isEnemy = true;
			dmg = 1;
			sprite_index = spr_MKSS_Attack_ChasseEmee_SwordClaw;
			mask_index = spr_MKSS_Attack_ChasseEmee_SwordClaw;
			scr_MKSS_Attack_ChasseEmee_SwordClaw_Setup();
			other.arm = id;
		}
		
		hsp = -3 * dirX;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decelFast * speedMultFinal;
		
		if (instance_place(x,y+1,obj_Wall)) hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Prepare
			case 0:
			with (arm) if (hsp == 0) hsp = -3;
			
			if (attackStateTimer[attackState] == -1)
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Thrust
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				with (arm) hsp = 10;
				hsp = 6 * dirX;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Post-Thrust
			case 2:
			if (attackStateTimer[attackState] == -1)
			{
				thrustTimes--;
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if (thrustTimes <= 1) 
				{
					with (arm) hsp = -6;
					
					attackState++;
				}
				else
				{
					with (arm) hsp = -10;
					
					attackState -= 2;
					attackStateTimer[attackState] = attackStateTimerMax[attackState+2];
				}
			}
			break;
			#endregion
			
			#region Prepare Cannonball
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprDuck;
				image_index = 0;
				
				with (arm) instance_destroy();
				
				shakeX = (attackStateTimerMax[attackState + 1] / 10) - 1;
				scr_MKSS_UI_ParryIndicator_Create(x,y - 32,depth - 1,attackStateTimerMax[attackState+1]);
			
				attackState++;
			}
			break;
			#endregion
			
			#region Cannonball
			case 4:
			if (attackStateTimer[attackState] == -1)
			{
				with (instance_create_depth(x,y -32,depth - 4,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_ChasseEmee_Cannonball;
					mask_index = spr_MKSS_Attack_ChasseEmee_Cannonball;
					scr_MKSS_Attack_ChasseEmee_Cannonball_Setup();
					hsp = 7 * other.dirX;
					vsp = 3;
					canBeParried = true;
					parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryCannonball"];
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Jump Back
			case 5:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprLookDown;
				image_index = 0;
				
				hsp = -2.6 * dirX;
				vsp = -3.2;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 6:
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