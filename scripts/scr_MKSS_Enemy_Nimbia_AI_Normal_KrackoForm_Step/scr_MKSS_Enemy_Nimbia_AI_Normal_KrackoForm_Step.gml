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
		
		#region Ball Shoot Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Post-Ball Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
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
		yBottom = y+8;
		yMiddle = yBottom-48;
		
		lightningAngle = choose(false,true);
		lightningAmount = 4;
		
		movespeed = 2;
		moveLimitLeft = 32;
		moveLimitRight = room_width-moveLimitLeft;
		stop = false;
		
		krackletTimerMax = 100;
		krackletTimer = krackletTimerMax;
		
		particleTimerMax = 3;
		particleTimer = particleTimerMax;
		
		ballId = -1;
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
				
				var _angle = 315;
				repeat(2)
				{
					if (krackletAmount < krackletLimit)
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
							angle = _angle;
							movementDmgCooldown = movementDmgCooldownMax;
						}
					}
					_angle = 225;
				}
				
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
			
			#region Kracklet Spawns
			//if (krackletTimer != -1) and (krackletAmount < krackletLimit)
			//{
			//	krackletTimer = max(krackletTimer - speedMultFinal,0);
			//	if (krackletTimer == 0)
			//	{
			//		with (instance_create_depth(x,y,depth + 1,obj_MKSS_Attack))
			//		{
			//			owner = other;
			//			isEnemy = true;
			//			dmg = -1;
			//			sprite_index = spr_MKSS_Attack_Nimbia_Kracklet;
			//			mask_index = spr_16x16Mask_MiddleOrigin;
			//			scr_MKSS_Attack_Nimbia_Kracklet_Setup();
			//			spd = 3;
			//			angle = point_direction(0,0,-other.dirX,1);
			//			movementDmgCooldown = movementDmgCooldownMax;
			//		}
					
			//		krackletTimer = krackletTimerMax;
			//	}
			//}
			#endregion
			
			if (attackStateTimer[attackState] == -1)
			{
				if (lightningAmount <= 0) 
				{
					hsp = 0;
					vsp = 2;
					
					with (instance_create_depth(x,y - 64,depth - 2,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = true;
						dmg = -1;
						dmgTarget = 1;
						sprite_index = spr_MKSS_Attack_Nimbia_KrackoBall;
						mask_index = spr_MKSS_Attack_Nimbia_KrackoBall;
						scr_MKSS_Attack_Nimbia_KrackoBall_Setup();
						scale = 0;
						image_xscale = scale;
						image_yscale = scale;
						other.ballId = id;
					}
					
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
							attackDraw = scr_MKSS_Attack_Nimbia_Lightning_Draw;
							strikeTimer = 40;
							postStrikeTimer = 20;
							image_alpha = .665;
							image_angle = (45*(other.lightningAngle))+(90*i);
							yBottom = other.yBottom;
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
			
			#region Ball Shoot
			case 3:
			if (y < yMiddle) vsp = 2;
			else 
			{
				y = yMiddle;
				
				vsp = 0;
			}
			
			particleTimer = max(particleTimer - speedMultFinal,0);
			if (particleTimer == 0)
			{
				var _x = x - (42 * dirX);
				var _y = y - 54;
				var _angle = point_direction(_x,_y,x,y - 64);
				var _spd = 4;
				var _timer = 8;
				scr_MKSS_ParticleSet_GreenLightning(_x,_y,lengthdir_x(_spd,_angle),lengthdir_y(_spd,_angle),_timer);
				_x = x + (44 * dirX);
				_angle = point_direction(_x,_y,x,y - 64);
				scr_MKSS_ParticleSet_GreenLightning(_x,_y,lengthdir_x(_spd,_angle),lengthdir_y(_spd,_angle),_timer);
				
				particleTimer = particleTimerMax;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				with (ballId)
				{
					angle = point_direction(x,y,obj_Player.x,obj_Player.y);
					spd = -2;
					
					scale = 1;
					
					dmg = dmgTarget;
					
					shot = true;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Post-Ball
			case 4:
			if (attackStateTimer[attackState] == -1)
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
			break;
			#endregion
			
			#region Fall
			case 5:
			if (attackStateTimer[attackState] == -1) or (instance_place(x,y+vsp+1,obj_Wall))
			{
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