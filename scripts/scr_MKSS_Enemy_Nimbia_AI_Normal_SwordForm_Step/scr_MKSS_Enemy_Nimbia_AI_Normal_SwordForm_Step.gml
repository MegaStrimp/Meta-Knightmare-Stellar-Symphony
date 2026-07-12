///@description MKSS - Enemy - Nimbia - AI - Normal - Sword Form - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_SwordForm_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Sword Form";
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
		attackStateTimerMax[i] = 130;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Sword Timer 1
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Sword Timer 2
		attackStateTimerMax[i] = 130;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Double Sword Timer
		attackStateTimerMax[i] = 130;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Prepare Slam Timer
		attackStateTimerMax[i] = 130;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slam Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Sword Form Variables
		hasGravity = false;
		
		yTop = y-48;
		
		swingLeft = choose(false,true);
		
		swordIdLeft = -1;
		swordIdRight = -1;
		#endregion
		
		#region Sword Form Start
		sprite_index = spriteSet.sprSwordForm;
		image_index = 0;
		
		dirX = 1;
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
			}
			
			if (attackStateTimer[attackState] == -1) or (image_index >= 17)
			{
				mask_index = spriteSet.sprSwordForm;
				image_alpha = 0;
				
				with (instance_create_depth(x+22,y+8,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_Nimbia_SwordForm;
					mask_index = spr_MKSS_Attack_Nimbia_SwordForm;
					scr_MKSS_Attack_Nimbia_SwordForm_Setup();
					offsetXDefault = 22;
					offsetYDefault = 8;
					offsetX = offsetXDefault;
					offsetY = offsetYDefault;
					other.swordIdRight = id;
				}
				with (instance_create_depth(x-24,y+8,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_Nimbia_SwordForm;
					mask_index = spr_MKSS_Attack_Nimbia_SwordForm;
					scr_MKSS_Attack_Nimbia_SwordForm_Setup();
					dirX = -1;
					image_xscale = dirX;
					offsetXDefault = -24;
					offsetYDefault = 8;
					offsetX = offsetXDefault;
					offsetY = offsetYDefault;
					other.swordIdLeft = id;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Sword
			case 2:
			case 3:
			if (y <= yTop) and (vsp != 0)
			{
				y = yTop;
				
				vsp = 0;
			}
				
			if (attackStateTimer[attackState] == -1)
			{				
				hsp = 6 * scr_MKSS_Enemy_DirTarget();
				
				if (swingLeft)
				{
					with (swordIdRight) prepareTimer = prepareTimerMax;
					if (point_distance(x,0,obj_MKSS_Player.x,0) <= 48) hsp = -8;
				}
				else
				{
					with (swordIdLeft) prepareTimer = prepareTimerMax;
					if (point_distance(x,0,obj_MKSS_Player.x,0) <= 48) hsp = 8;
				}
				
				swingLeft = !swingLeft;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Double Sword
			case 4:
			if (attackStateTimer[attackState] == -1)
			{				
				hsp = -8 * scr_MKSS_Enemy_DirTarget();
				
				with (swordIdRight) prepareTimer = prepareTimerMax;
				with (swordIdLeft) prepareTimer = prepareTimerMax;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Prepare Slam
			case 5:
			if (attackStateTimer[attackState] == -1)
			{				
				with (swordIdRight)
				{
					repeat(32)
					{
						var _len = irandom_range(0,sprite_height);
						var _x = lengthdir_x(_len,(image_angle - 90) % 360) + irandom_range(-8,8);
						var _y = lengthdir_y(_len,(image_angle - 90) % 360) + irandom_range(-8,8);
						scr_MKSS_ParticleSet_NimbiaCloud(x+_x,y+_y,0,0,-1)
					}
					
					instance_destroy();
				}
				with (swordIdLeft)
				{
					repeat(32)
					{
						var _len = irandom_range(0,sprite_height);
						var _x = lengthdir_x(_len,(image_angle - 90) % 360) + irandom_range(-8,8);
						var _y = lengthdir_y(_len,(image_angle - 90) % 360) + irandom_range(-8,8);
						scr_MKSS_ParticleSet_NimbiaCloud(x+_x,y+_y,0,0,-1)
					}
					
					instance_destroy();
				}
				
				repeat(32)
				{
					var _len = irandom_range(0,12);
					var _dir = irandom_range(0,359);
					var _spd = random_range(.5,2);
					var _x = lengthdir_x(_len,_dir);
					var _y = lengthdir_y(_len,_dir);
					scr_MKSS_ParticleSet_NimbiaCloud(x+_x,y-8+_y,lengthdir_x(_spd,_dir),lengthdir_y(_spd,_dir),-2)
				}
				
				sprite_index = spriteSet.sprDownThrust1;
				mask_index = spriteSet.maskIndexDefault;
				image_index = 0;
				
				dirX = scr_MKSS_Enemy_DirTarget();
				image_alpha = 1;
				vsp = -2;
				
				hasGravity = true;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Slam
			case 6:
			if (attackStateTimer[attackState] == -1) or (instance_place(x,y+vsp+1,obj_Wall))
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 7:
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