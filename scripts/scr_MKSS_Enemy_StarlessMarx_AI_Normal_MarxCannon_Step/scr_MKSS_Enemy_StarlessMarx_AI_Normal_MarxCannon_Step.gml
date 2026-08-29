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
		attackStateTimerMax[i] = 300;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Marx Cannon Variables
		#endregion
		
		#region Marx Cannon Start
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
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
				
				with (instance_create_depth(0,0,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					knockbackForce = 1;
					scr_MKSS_Attack_StarlessMarx_MarxCannon_Setup();
				}
					
				attackState++;
			}
			break;
			#endregion
			
			#region Laser
			case 6:
			if (x >= -40) and (x <= room_width + 40) hsp = -8 * dirX;
			else hsp = 0;
			
			//if (attackStateTimer[attackState] == -1)
			//{
			//	dirX = 1;
				
			//	sprite_index = spriteSet.sprIdle;
			//	image_index = 0;
					
			//	attackState++;
			//}
			break;
			#endregion
			
			#region Finish Attack
			case 8:
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
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