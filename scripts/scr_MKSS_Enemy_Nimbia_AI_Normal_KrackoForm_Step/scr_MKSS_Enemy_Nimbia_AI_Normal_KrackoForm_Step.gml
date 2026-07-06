///@description MKSS - Enemy - Nimbia - AI - Normal - Kracko Form - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_KrackoForm_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Kracko Form";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Transform Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Post-Transform Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Lightning Timer
		attackStateTimerMax[i] = 120;
		attackStateTimer[i] = attackStateTimerMax[i]/4;
		i++;
		#endregion
		
		#region Fall Timer
		attackStateTimerMax[i] = 120;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Kracko Form Variables
		hasGravity = false;
		
		yTop = y-64;
		
		lightningAngle = choose(false,true);
		lightningAmount = 4;
		
		movespeed = 2;
		moveLimitLeft = 32;
		moveLimitRight = room_width-moveLimitLeft;
		stop = false;
		
		krackletTimerMax = 100;
		krackletTimer = krackletTimerMax;
		#endregion
		
		#region Kracko Form Start
		sprite_index = spriteSet.sprKrackoForm;
		image_index = 0;
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
			#region Transform
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				vsp = -2;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Post-Transform
			case 1:
			if (y <= yTop) and (vsp != 0)
			{
				y = yTop;
				
				vsp = 0;
				
				y = yTop + sine_between(global.currentTimePausable / 100,1,-6,6);
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				dirX = scr_MKSS_Enemy_DirTarget();
				
				attackState++;
			}
			break;
			#endregion
			
			#region Lightning
			case 2:
			if (!stop)
			{
				hsp = movespeed * dirX;
				if (x <= moveLimitLeft) dirX = 1;
				if (x >= moveLimitRight) dirX = -1;
			
				y = yTop + sine_between(global.currentTimePausable / 100,1,-6,6);
			}
			else
			{
				hsp = 0;
				
				y = yTop;
			}
			
			if (krackletTimer != -1) and (krackletAmount < krackletLimit)
			{
				krackletTimer = max(krackletTimer - speedMultFinal,0);
				if (krackletTimer == 0)
				{
					with (instance_create_depth(x,y,depth + 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = true;
						dmg = -1;
						sprite_index = spr_MKSS_Attack_Nimbia_Kracklet;
						mask_index = spr_16x16Mask_MiddleOrigin;
						scr_MKSS_Attack_Nimbia_Kracklet_Setup();
						spd = 3;
						angle = point_direction(0,0,-other.dirX,1);
						movementDmgCooldown = movementDmgCooldownMax;
					}
					
					krackletTimer = krackletTimerMax;
				}
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				if (lightningAmount <= 0) 
				{
					repeat(64)
					{
						scr_MKSS_ParticleSet_NimbiaCloud(x + irandom_range(-48,48),y + irandom_range(-48,48),random_range(-1,1),random_range(-1,1),-3);
					}
					
					sprite_index = spriteSet.sprIdle;
					image_index = 0;
					
					hasGravity = true;
					
					attackState++;
				}
				else 
				{
					var i = 0;
					repeat(4)
					{
						with (instance_create_depth(x,y,depth + 2,obj_MKSS_Attack))
						{
							owner = other;
							isEnemy = true;
							dmg = -1;
							dmgTarget = 1;
							sprite_index = spr_MKSS_Attack_Nimbia_LightningIndicator;
							mask_index = spr_MKSS_Attack_Nimbia_Lightning;
							attackAIStep = scr_MKSS_Attack_Nimbia_Lightning_Step;
							strikeTimer = 40;
							postStrikeTimer = 20;
							image_alpha = .665;
							image_angle = (45*(other.lightningAngle))+(90*i);
						}
						
						i++;
					}
					
					lightningAngle = !lightningAngle;
					lightningAmount--;
					
					attackStateTimer[attackState] = attackStateTimerMax[attackState];
				}
			}
			break;
			#endregion
			
			#region Fall
			case 3:
			if (attackStateTimer[attackState] == -1) or (instance_place(x,y+vsp+1,obj_Wall))
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 4:
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
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