///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Giant Slash - Step

function scr_MKSS_Enemy_Andromeda1_AI_Normal_GiantSlash_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Andromeda - Giant Slash";
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
		
		#region Transform Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slash Prepare Timer
		attackStateTimerMax[i] = 80;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slash Impact Timer
		attackStateTimerMax[i] = 24;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Transform Back Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Finish Transform Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Rapid Slash Variables
		slash = -1;
		slashTimes = 2;
		
		yStart = ystart;
		yTarget = 192;
		
		moveSpeedStart = .5;
		moveSpeed = .5;
		xLimit = 48;
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
				hsp = 0;
				vsp = 0;
				
				y = yTarget;
				
				armLB.image_alpha = 0;
				armRB.image_alpha = 0;
				armLT.image_alpha = 0;
				armRT.image_alpha = 0;
				
				with (instance_create_depth(x,y,depth - 3,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = -1;
					sprite_index = spr_MKSS_Attack_Andromeda1_GiantSword_Combine;
					mask_index = spr_MKSS_Attack_Andromeda1_GiantSword_Combine;
					attackAIStep = scr_MKSS_Attack_Andromeda1_RapidSlash_Step;
					image_xscale = other.image_xscale;
					pauseAfterAnimation = true;
					other.slash = id;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Transform
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				dirX = scr_MKSS_Enemy_DirTarget();
				
				scr_MKSS_UI_ParryIndicator_Create(x,y - 36,depth - 8,attackStateTimerMax[attackState + 1]);
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Slash Prepare
			case 2:
			if (attackStateTimer[attackState] <= 20)
			{
				shakeX = 3;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				with (slash)
				{
					dmg = 20;
					
					sprite_index = spr_MKSS_Attack_Andromeda1_GiantSword_Swing;
					mask_index = spr_MKSS_Attack_Andromeda1_GiantSword_Swing;
					
					image_index = 0;
					
					canBeParried = true;
					if (other.slashTimes > 1) parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryAndromedaGiantSword1"];
					else parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryAndromedaGiantSword2"];
				}
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Slash Impact
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				var _range = 156;
				with (obj_Player)
				{
					if ((x <= other.x - 4) and (x >= other.x - _range) and (other.dirX == -1)) or ((x >= other.x + 4) and (x <= other.x + _range) and (other.dirX == 1))
					{
						if (grounded) and (hurtState == hurtStates.none)
						{
							scr_PlaySfx(snd_MKSS_Hurt);
							
							scr_MKSS_Player_GetHit(id,20);
						}
					}
				}
				
				scr_Camera_SetScreenshake(2,4);
				repeat(irandom_range(20,28)) scr_MKSS_ParticleSet_HalberdRubble(x + (80 * dirX) + irandom_range(-40,40),224);
				
				with (slash)
				{
					dmg = -1;
					
					canBeParried = false;
				}
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Transform Back
			case 4:
			if (attackStateTimer[attackState] == -1)
			{
				with (slash)
				{
					sprite_index = spr_MKSS_Attack_Andromeda1_GiantSword_Revert;
					mask_index = spr_MKSS_Attack_Andromeda1_GiantSword_Revert;
					
					image_index = 0;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Transform Back
			case 5:
			if (y > yStart) vsp = -2;
			else
			{
				y = yStart;
				vsp = 0;
			}
			
			if (attackStateTimer[attackState] == -1) or (slash.image_index >= 3)
			{
				arm[0] = false;
				arm[1] = false;
				arm[2] = false;
				arm[3] = false;
		
				armLB.image_alpha = 1;
				armRB.image_alpha = 1;
				armLT.image_alpha = 1;
				armRT.image_alpha = 1;
				
				with (slash) instance_destroy();
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 6:
			if (y > yStart) vsp = -2;
			else
			{
				y = yStart;
				vsp = 0;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				y = yStart
				vsp = 0;
				
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