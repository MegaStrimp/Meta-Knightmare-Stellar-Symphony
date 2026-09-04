///@description MKSS - Enemy - Starless Marx - AI - Normal - Marx Cannon - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_MarxCannon_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Starless Marx - Marx Cannon";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Start Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Dash Start Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Dash Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Dash End Timer
		attackStateTimerMax[i] = 10;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Laser Start Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Laser Charge Timer
		attackStateTimerMax[i] = 80;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Laser Timer
		attackStateTimerMax[i] = 150;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Finish Laser Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Parry Dash Prepare Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Parry Dash Timer
		attackStateTimerMax[i] = 80;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Marx Cannon Variables
		laser = -1;
		
		parryDash = false;
		#endregion
		
		#region Marx Cannon Start
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		
		hitbox = -1;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		var decelFinal = decelFast * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		vsp = scr_Entity_Friction(vsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Start
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				dirX = 1;
				if (x >= room_width/2) dirX = -1;
				
				hsp = -3 * dirX;
				
				sprite_index = spriteSet.sprArrow;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Dash Start
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				shakeX = 2;
				
				sprite_index = spriteSet.sprFly;
				image_index = 0;
					
				attackState++;
			}
			break;
			#endregion
			
			#region Dash
			case 2:
			hsp = 5 * dirX;
			
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprArrow;
				image_index = 0;
					
				attackState++;
			}
			break;
			#endregion
			
			#region Dash End
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				dirX = 1;
				
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
					
				attackState++;
			}
			break;
			#endregion
			
			#region Laser Start
			case 4:			
			if (attackStateTimer[attackState] == -1)
			{
				dirX = 1;
				if (x >= room_width/2) dirX = -1;
				
				instance_create_layer(0,0,"Player",obj_MKSS_Attack_BlackHole_ScreenDarken);
				
				sprite_index = spriteSet.sprCloseWing;
				image_index = 0;
				
				scr_MKSS_UI_ParryIndicator_Create(x + (24 * dirX),y,depth - 1,attackStateTimerMax[attackState+1]);
				
				attackState++;
			}
			break;
			#endregion
			
			#region Laser Charge
			case 5:
			if (attackStateTimer[attackState] <= 10)
			{
				sprite_index = spriteSet.sprLaser;
				image_index = 0;
				imageSpeed = 0;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				image_index = 1;
				
				scr_PlaySfx(snd_MKSS_MarxWave);
				
				with (instance_create_depth(0,0,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					knockbackForce = 1;
					scr_MKSS_Attack_StarlessMarx_MarxCannon_Setup();
					other.laser = id;
				}
					
				attackState++;
			}
			break;
			#endregion
			
			#region Laser
			case 6:
			if (x >= -40) and (x <= room_width + 40) hsp = -8 * dirX;
			else hsp = 0;
			
			if (attackStateTimer[attackState] == -1)
			{
				imageSpeed = 1;
				
				with (laser) finish = true;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Laser
			case 7:
			if (attackStateTimer[attackState] == -1) or (!instance_exists(laser))
			{
				if (parryDash) 
				{
					scr_MKSS_UI_ParryIndicator_Create(obj_Player.x,obj_Player.y,depth - 1,attackStateTimerMax[attackState+1],,obj_Player);
					
					attackState++;
				}
				else attackState = 10;
			}
			break;
			#endregion
			
			#region Parry Dash Prepare
			case 8:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprFly;
				image_index = 0;
				
				with (instance_create_depth(0,0,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					knockbackForce = 1;
					attackAIStep = scr_MKSS_Attack_StarlessMarx_ParryDash_Step;
					sprite_index = spr_MKSS_Enemy_StarlessMarx_Base_Fly;
					mask_index = spr_MKSS_Enemy_StarlessMarx_Base_Fly;
					image_alpha = 0;
					canBeParried = true;
					parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryMarxDash"];
					other.hitbox = id;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Parry Dash
			case 9:
			hsp = 8 * dirX;
			
			if (attackStateTimer[attackState] == -1)
			{
				with (hitbox) instance_destroy();
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 10:
			if (attackStateTimer[attackState] == -1)
			{
				scr_MKSS_Enemy_StarlessMarx_Teleport((room_width/2) + irandom_range(-32,32),72 + irandom_range(-8,8),enemyAIStepIdle,,0);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}