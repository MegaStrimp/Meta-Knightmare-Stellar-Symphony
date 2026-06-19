///@description MKSS - Enemy - Gigant Edge - AI - Normal - Walk - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_Walk_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Gigant Edge - Walk";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Walk Timer
		attackStateTimerMax[i] = 120;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Sword Swing Variables
		walk_movespeed = .25;
		#endregion
		
		#region WalK Start		
		sprite_index = spriteSet.sprWalk;
		image_index = 0;
		#endregion
	
		#region Component Setup
		scr_Component_BasicHorizontal_Setup(walk_movespeed);
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Friction
		if (grounded)
		{
			var decelFinal = decel * speedMultFinal;
			
			hsp = scr_Entity_Friction(hsp,decelFinal);
		}
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Walking
			case 0:
			scr_Component_BasicHorizontal_Step(true);
			
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