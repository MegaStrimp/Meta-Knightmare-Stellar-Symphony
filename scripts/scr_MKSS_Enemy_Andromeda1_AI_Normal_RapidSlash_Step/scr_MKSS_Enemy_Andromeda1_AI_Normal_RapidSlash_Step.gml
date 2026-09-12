///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Rapid Slash - Step

function scr_MKSS_Enemy_Andromeda1_AI_Normal_RapidSlash_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Andromeda - Rapid Slash";
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
		attackStateTimerMax[i] = 180;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Tornado Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Rapid Slash Variables
		slash = -1;
		tornadoFront = -1;
		tornadoBack = -1;
		
		yStart = ystart;
		yTarget = 192;
		
		moveSpeedStart = .5;
		moveSpeed = .5;
		xLimit = 48;
		
		tornadoSpeed = 0;
		tornadoSpeedMax = 6;
		tornadoAccel = .1;
		#endregion
		
		#region Rapid Slash Start
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		
		arm[0] = true;
		arm[1] = true;
		arm[2] = true;
		arm[3] = true;
		
		armLT.sprite_index = spriteSet.sprArmLT_SwordAppear;
		armLT.image_index = 0;
		armLT.depth = depth - 4;
		
		armRT.sprite_index = spriteSet.sprArmRT_SwordAppear;
		armRT.image_index = 0;
		armRT.depth = depth - 4;
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
			hsp = -moveSpeedStart * dirX;
			x = clamp(x,xLimit,room_width - xLimit);
			
			if (y < yTarget) vsp = 3;
			else vsp = 0;
			
			if (attackStateTimer[attackState] == -1)
			{
				vsp = 0;
				y = yTarget;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Slash Prepare
			case 1:
			armLB.x += irandom_range(-1,1);
			armLB.y += irandom_range(-1,1);
			armRB.x += irandom_range(-1,1);
			armRB.y += irandom_range(-1,1);
			armLT.x += irandom_range(-1,1);
			armLT.y += irandom_range(-1,1);
			armRT.x += irandom_range(-1,1);
			armRT.y += irandom_range(-1,1);
				
			if (attackStateTimer[attackState] == -1)
			{
				armLB.image_alpha = 0;
				armRB.image_alpha = 0;
				armLT.image_alpha = 0;
				armRT.image_alpha = 0;
				
				with (instance_create_depth(x,y,depth - 3,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = 8;
					sprite_index = spr_MKSS_Attack_Andromeda1_RapidSlash;
					mask_index = spr_MKSS_Attack_Andromeda1_RapidSlash;
					attackAIStep = scr_MKSS_Attack_Andromeda1_RapidSlash_Step;
					image_xscale = other.image_xscale;
					other.slash = id;
				}
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Slash
			case 2:
			hsp = moveSpeed * dirX;
			
			if (attackStateTimer[attackState] == -1)
			{
				with (slash) instance_destroy();
				
				armLB.image_alpha = 1;
				armRB.image_alpha = 1;
				armLT.image_alpha = 1;
				armRT.image_alpha = 1;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Tornado
			case 3:
			shakeX = 3;
			shakeY = 1;
			armLB.x += irandom_range(-shakeX,shakeX);
			armLB.y += irandom_range(-shakeY,shakeY);
			armRB.x += irandom_range(-shakeX,shakeX);
			armRB.y += irandom_range(-shakeY,shakeY);
			armLT.x += irandom_range(-shakeX,shakeX);
			armLT.y += irandom_range(-shakeY,shakeY);
			armRT.x += irandom_range(-shakeX,shakeX);
			armRT.y += irandom_range(-shakeY,shakeY);
			
			if (attackStateTimer[attackState] == -1)
			{
				armLB.image_alpha = 0;
				armRB.image_alpha = 0;
				armLT.image_alpha = 0;
				armRT.image_alpha = 0;
				
				with (instance_create_depth(x,y,depth - 3,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = 8;
					sprite_index = spr_MKSS_Attack_Andromeda1_TornadoFront;
					mask_index = spr_MKSS_Attack_Andromeda1_TornadoFront;
					attackAIStep = scr_MKSS_Attack_Andromeda1_RapidSlash_Step;
					image_xscale = other.image_xscale;
					other.tornadoFront = id;
				}
				with (instance_create_depth(x,y,depth + 3,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = 8;
					sprite_index = spr_MKSS_Attack_Andromeda1_TornadoBack;
					mask_index = spr_MKSS_Attack_Andromeda1_TornadoBack;
					attackAIStep = scr_MKSS_Attack_Andromeda1_RapidSlash_Step;
					image_xscale = other.image_xscale;
					other.tornadoFront = id;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 4:
			if (y > -96)
			{
				tornadoSpeed = min(tornadoSpeed + (tornadoAccel * speedMultFinal),tornadoSpeedMax);
				vsp = -tornadoSpeed;
			} 
			else vsp = 0;
			
			if (attackStateTimer[attackState] == -1)
			{
				armLB.image_alpha = 1;
				armRB.image_alpha = 1;
				armLT.image_alpha = 1;
				armRT.image_alpha = 1;
				
				vsp = 0;
				
				attackState++;
				//scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
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