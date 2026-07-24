///@description MKSS - Enemy - Chasse Emee - AI - Normal - Cannonball Bounce - Step

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_CannonballBounce_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Chasse-Emee - Cannonball Bounce";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Prepare Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Cannonball Timer
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
		
		#region Cannonball Bounce Variables
		cannonballTimes = 3;
		#endregion
		
		#region Cannonball Bounce Start
		sprite_index = spriteSet.sprLookDown;
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
			#region Prepare
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				shakeX = (attackStateTimerMax[attackState + 1] / 10) - 1;
				scr_MKSS_UI_ParryIndicator_Create(x,y - 40,depth - 1,attackStateTimerMax[attackState+1]);
				
				attackState++;
			}
			break;
			#endregion
			
			#region Cannonball
			case 1:
			var _y = -48;
			switch(cannonballTimes)
			{
				case 1:
				sprite_index = spriteSet.sprDuck;
				_y = -40;
				break;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				with (instance_create_depth(x,y + _y,depth - 4,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_ChasseEmee_Cannonball;
					mask_index = spr_MKSS_Attack_ChasseEmee_Cannonball;
					scr_MKSS_Attack_ChasseEmee_Cannonball_Setup();
					switch(other.cannonballTimes)
					{
						case 3:
						hsp = 3 * other.dirX;
						vsp = 7;
						break;
						
						case 2:
						hsp = 5 * other.dirX;
						vsp = 5;
						break;
						
						case 1:
						hsp = 7 * other.dirX;
						vsp = 3;
						break;
					}
					canBeParried = true;
					parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryCannonball"];
				}
				
				switch(cannonballTimes)
				{
					case 1:
					_y = -40;
					break;
				}
				
				cannonballTimes--;
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if (cannonballTimes <= 0) attackState++;
				else
				{
					shakeX = (attackStateTimerMax[attackState] / 10) -1;
					scr_MKSS_UI_ParryIndicator_Create(x,y + _y,depth - 1,attackStateTimerMax[attackState]);
				}
			}
			break;
			#endregion
			
			#region Finish Attack
			case 2:
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