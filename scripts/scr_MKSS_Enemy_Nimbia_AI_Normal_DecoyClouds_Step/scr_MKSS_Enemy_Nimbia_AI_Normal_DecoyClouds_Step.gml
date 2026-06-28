///@description MKSS - Enemy - Nimbia - AI - Normal - Decoy Clouds - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_DecoyClouds_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Decoy Clouds";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Cloud Create Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Strike Ready Timer
		attackStateTimerMax[i] = 80;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Strike Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 80;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Decoy Cloud Variables
		hasGravity = false;
		
		yStart = y;
		
		cloud1 = -1;
		cloud2 = -1;
		cloud3 = -1;
		cloudTarget = -1;
		#endregion
		
		#region Decoy Cloud Start
		sprite_index = spriteSet.sprDownThrust1;
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
			#region Cloud Create
			case 0:
			vsp = -2;
			
			if (attackStateTimer[attackState] == -1)
			{
				with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					sprite_index = spr_MKSS_Attack_Nimbia_DecoyCloud;
					mask_index = spr_MKSS_Attack_Nimbia_DecoyCloud;
					attackAIStep = scr_MKSS_Attack_Nimbia_DecoyCloud_Step;
					
					xTarget = (room_width / 2) - 96;
					yTarget = other.yStart - 96;
					other.cloud1 = id;
					eye = false;
					attackDraw = scr_MKSS_Attack_Nimbia_DecoyCloud_Draw;
					pauseAfterAnimation = true;
					strikeReady = false;
				}
				
				with (instance_create_depth(x,y,depth - 2,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					sprite_index = spr_MKSS_Attack_Nimbia_DecoyCloud;
					mask_index = spr_MKSS_Attack_Nimbia_DecoyCloud;
					attackAIStep = scr_MKSS_Attack_Nimbia_DecoyCloud_Step;
					
					xTarget = room_width / 2;
					yTarget = other.yStart - 96;
					other.cloud2 = id;
					eye = false;
					attackDraw = scr_MKSS_Attack_Nimbia_DecoyCloud_Draw;
					pauseAfterAnimation = true;
					strikeReady = false;
				}
				
				with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					sprite_index = spr_MKSS_Attack_Nimbia_DecoyCloud;
					mask_index = spr_MKSS_Attack_Nimbia_DecoyCloud;
					attackAIStep = scr_MKSS_Attack_Nimbia_DecoyCloud_Step;
					
					xTarget = (room_width / 2) + 96;
					yTarget = other.yStart - 96;
					other.cloud3 = id;
					eye = false;
					attackDraw = scr_MKSS_Attack_Nimbia_DecoyCloud_Draw;
					pauseAfterAnimation = true;
					strikeReady = false;
				}
				
				
				image_alpha = 0;
				x = -1000;
				y = -1000;
				pauseOutsideView = false;
				
				hsp = 0;
				vsp = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Strike Ready
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				cloudTarget = irandom_range(1,3);
				switch (cloudTarget)
				{
					case 1:
					cloud1.eye = true;
					cloud1.dirX = scr_MKSS_Enemy_DirTarget();
					cloud2.strikeReady = true;
					cloud3.strikeReady = true;
					break;
					
					case 2:
					cloud1.strikeReady = true;
					cloud2.eye = true;
					cloud2.dirX = scr_MKSS_Enemy_DirTarget();
					cloud3.strikeReady = true;
					break;
					
					case 3:
					cloud1.strikeReady = true;
					cloud2.strikeReady = true;
					cloud3.eye = true;
					cloud3.dirX = scr_MKSS_Enemy_DirTarget();
					break;
				}
				
				attackState++;
			}
			#endregion
			
			#region Strike Ready
			case 2:
			if (attackStateTimer[attackState] == -1)
			{
				with (cloud1)
				{
					if (strikeReady)
					{
						with (instance_create_depth(x,y,depth + 1,obj_MKSS_Attack))
						{
							owner = other.owner;
							isEnemy = true;
							dmg = 1;
							sprite_index = spr_MKSS_Attack_Nimbia_LightningGround;
							mask_index = spr_MKSS_Attack_Nimbia_LightningGround;
							attackAIStep = scr_MKSS_Attack_Nimbia_CloudLightning_Step;
							image_angle = 270;
							hsp = 0;
							vsp = 6;
						}
					}
					strikeReady = false;
					eye = false;
				}
				
				with (cloud2)
				{
					if (strikeReady)
					{
						with (instance_create_depth(x,y,depth + 1,obj_MKSS_Attack))
						{
							owner = other.owner;
							isEnemy = true;
							dmg = 1;
							sprite_index = spr_MKSS_Attack_Nimbia_LightningGround;
							mask_index = spr_MKSS_Attack_Nimbia_LightningGround;
							attackAIStep = scr_MKSS_Attack_Nimbia_CloudLightning_Step;
							image_angle = 270;
							hsp = 0;
							vsp = 6;
						}
					}
					strikeReady = false;
					eye = false;
				}
				
				with (cloud3)
				{
					if (strikeReady)
					{
						with (instance_create_depth(x,y,depth + 1,obj_MKSS_Attack))
						{
							owner = other.owner;
							isEnemy = true;
							dmg = 1;
							sprite_index = spr_MKSS_Attack_Nimbia_LightningGround;
							mask_index = spr_MKSS_Attack_Nimbia_LightningGround;
							attackAIStep = scr_MKSS_Attack_Nimbia_CloudLightning_Step;
							image_angle = 270;
							hsp = 0;
							vsp = 6;
						}
					}
					strikeReady = false;
					eye = false;
				}
				
				switch (cloudTarget)
				{
					case 1:
					x = cloud1.x;
					y = cloud1.y;
					break;
					
					case 2:
					x = cloud2.x;
					y = cloud2.y;
					break;
					
					case 3:
					x = cloud3.x;
					y = cloud3.y;
					break;
				}
				
				dirX = scr_MKSS_Enemy_DirTarget();
				image_alpha = 1;
				vsp = 6;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				instance_destroy(cloud1);
				instance_destroy(cloud2);
				instance_destroy(cloud3);
				
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