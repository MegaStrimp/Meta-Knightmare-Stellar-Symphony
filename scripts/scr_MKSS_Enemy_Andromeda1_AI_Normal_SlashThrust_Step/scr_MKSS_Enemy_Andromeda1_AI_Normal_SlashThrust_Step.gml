///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Slash Thrust - Step

function scr_MKSS_Enemy_Andromeda1_AI_Normal_SlashThrust_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Andromeda - Slash Thrust";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Move Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slash Prepare Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slash Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Thrust Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Thrust End Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Slash Thrust Variables
		slashCountMax = 2;
		slashCount = slashCountMax;
		slashed = false;
		
		yStart = ystart;
		yTarget = 192;
		
		moveSpeedStart = .5;
		xLimit = 48;
		#endregion
		
		#region Slash Thrust Start
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		
		arm[0] = true;
		arm[1] = true;
		
		armLB.sprite_index = spriteSet.sprArmLB_Straight;
		armLB.image_index = 0;
		
		armRB.sprite_index = spriteSet.sprArmRB_SlashPrepare;
		armRB.image_index = 0;
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
			#region Move
			case 0:
			armLBOffsetX = clamp(armLBOffsetX - (4 * dirX),-44,44);
			
			hsp = -moveSpeedStart * dirX;
			x = clamp(x,xLimit,room_width - xLimit);
			
			if (y < yTarget) vsp = 3;
			else vsp = 0;
			
			if (attackStateTimer[attackState] == -1)
			{
				vsp = 0;
				y = yTarget;
				
				armLBOffsetX = -44 * dirX;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Slash Prepare
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				hsp = 4 * dirX;
				
				armRB.sprite_index = spriteSet.sprArmRB_Slash;
				armRB.image_index = 0;
				
				slashed = false;
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Slash
			case 2:
			if (armRB.image_index >= 2) and (!slashed)
			{
				with (instance_create_depth(armRB.x + 32 * dirX,armRB.y,armRB.depth - 2,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = 8;
					sprite_index = spr_MKSS_Attack_Andromeda1_SwordBeam;
					mask_index = spr_MKSS_Attack_Andromeda1_SwordBeam;
					attackAIStep = scr_MKSS_Attack_Andromeda1_SwordBeam_Step;
					spd = 3;
					angle = 0;
					if (other.dirX == -1) angle = 180;
					image_angle = angle;
				}
				
				slashed = true;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				slashCount--;
				
				dirX = scr_MKSS_Enemy_DirTarget();
				armLBDir[0] = dirX;
				armLBOffsetX = abs(armLBOffsetX) * -dirX;
				armRBDir[0] = dirX;
				armRBOffsetX = abs(armRBOffsetX) * dirX;
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState]
				if (slashCount <= 0) 
				{
					armRB.sprite_index = spriteSet.sprArmRB_Idle;
					armRB.image_index = 0;
					
					attackState++;
				}
				else
				{
					armRB.sprite_index = spriteSet.sprArmRB_SlashPrepare;
					armRB.image_index = 0;
					
					attackState--;
				}
			}
			break;
			#endregion
			
			#region Thrust
			case 3:
			armLB.x += irandom_range(-2,2);
			armLB.y += irandom_range(-2,2);
			
			hsp = -moveSpeedStart * dirX;
			x = clamp(x,xLimit,room_width - xLimit);
			
			if (attackStateTimer[attackState] == -1)
			{
				hsp = 16 * dirX;
				
				armLB.dmg = 8;
					
				attackState++;
			}
			break;
			#endregion
			
			#region Thrust End
			case 4:
			x = clamp(x,xLimit,room_width - xLimit);
			
			armLBOffsetX = clamp(armLBOffsetX + (6 * dirX),-44,44);
			
			if (attackStateTimer[attackState] == -1)
			{
				armRB.dmg = -1;
					
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 5:
			if (y > yStart) vsp = -3;
			else vsp = 0;
			
			if (point_distance(armLBOffsetX,0,-28 * dirX,0) > 6) armLBOffsetX = clamp(armLBOffsetX - (4 * dirX),-44,44);
			else 
			{
				armLB.sprite_index = spriteSet.sprArmLB_Idle;
				
				armLBOffsetX = -28 * dirX;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				y = yStart;
				
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Collision
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}