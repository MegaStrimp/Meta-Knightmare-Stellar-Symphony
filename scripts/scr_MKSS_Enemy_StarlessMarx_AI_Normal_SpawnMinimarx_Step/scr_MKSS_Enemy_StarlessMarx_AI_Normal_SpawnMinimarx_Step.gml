///@description MKSS - Enemy - Starless Marx - AI - Normal - Spawn Minimarx - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_SpawnMinimarx_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Starless Marx - Spawn Minimarx";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		
		enemyAnimationEnd = scr_MKSS_Enemy_StarlessMarx_AI_Normal_BlackHole_AnimationEnd;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Start Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Minimarx Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 160;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Spawn Minimarx Variables
		minimarxCount = 3;
		
		wingOutTimerMax = 8;
		wingOutTimer = -1;
		#endregion
		
		#region Spawn Minimarx Start
		sprite_index = spriteSet.sprSplit;
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
		vsp = scr_Entity_Friction(vsp,decelFinal);
		#endregion
		
		#region Attack States
		switch (attackState)
		{
			#region Start
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				wingOutTimer = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Minimarx
			case 1:
			if (wingOutTimer != -1)
			{
				wingOutTimer = max(wingOutTimer - speedMultFinal,0);
				if (wingOutTimer == 0)
				{
					shakeX = 3;
					shakeY = 1;
							
					wingOutTimer = -1;
				}
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				shakeY = 4;
				
				wingOutTimer = wingOutTimerMax;
				
				with (instance_create_depth(x - 8,y - 8,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					knockbackForce = 1;
					sprite_index = spr_MKSS_Attack_StarlessMarx_MinimarxPaint_Ball;
					mask_index = spr_MKSS_Attack_StarlessMarx_MinimarxPaint_Ball;
					scr_MKSS_Attack_StarlessMarx_MinimarxPaint_Setup();
					hsp = -random_range(.5,1.75);
					vsp = -random_range(2.5,4.5);
				}
				
				with (instance_create_depth(x + 8,y - 8,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					knockbackForce = 1;
					sprite_index = spr_MKSS_Attack_StarlessMarx_MinimarxPaint_Ball;
					mask_index = spr_MKSS_Attack_StarlessMarx_MinimarxPaint_Ball;
					scr_MKSS_Attack_StarlessMarx_MinimarxPaint_Setup();
					hsp = random_range(.5,1.75);
					vsp = -random_range(2.5,4.5);
				}
				
				minimarxCount--;
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if (minimarxCount <= 0) 
				{
					sprite_index = spriteSet.sprSplitEnd;
					image_index = 0;
					
					attackState++;
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
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}