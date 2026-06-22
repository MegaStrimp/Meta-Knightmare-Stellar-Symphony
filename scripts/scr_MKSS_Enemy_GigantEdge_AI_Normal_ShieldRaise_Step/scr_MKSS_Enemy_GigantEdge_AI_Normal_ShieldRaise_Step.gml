///@description MKSS - Enemy - Gigant Edge - AI - Normal - Shield Raise - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_ShieldRaise_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Gigant Edge - Shield Raise";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		prevDefense = defense;
		defense = 4;
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Revert Timer
		attackStateTimerMax[i] = 240;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Charge Swing Start		
		sprite_index = spriteSet.sprShieldUp;
		image_index = 0;
		
		hsp = 1 * dirX;
		
		rangoParryCount = 0;
		
		var _x = clamp(x + (24 * dirX),0,room_width);
		rango1 = instance_create_depth(_x,room_height,depth - 1,obj_MKSS_Enemy_Rango);
		with (rango1)
		{
			owner = other;
			target = other;
			dirX = other.dirX;	
			
			hsp = 1 * dirX;
			vsp = -3;
			
			scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Setup();
			attackTimer = 60;
			parryEnemyTarget = obj_MKSS_Enemy_GigantEdge;
		}
		
		_x = clamp(x + (64 * dirX),0,room_width);
		rango2 = instance_create_depth(_x,room_height,depth - 1,obj_MKSS_Enemy_Rango);
		with (rango2)
		{
			owner = other;
			target = other;
			dirX = other.dirX;
			
			hsp = .5 * dirX;
			vsp = -2;
			
			scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Setup();
			attackTimer = 160;
			parryEnemyTarget = obj_MKSS_Enemy_GigantEdge;
		}
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
			#region Finish Attack
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				defense = prevDefense;
				
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