///@description MKSS - Enemy - Starless Marx - AI - Normal - Arrow Arrow End - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_ArrowArrowEnd_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Starless Marx - Arrow Arrow";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Start Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Prepare Arrows Timer
		attackStateTimerMax[i] = 10;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Shoot Arrows Timer
		attackStateTimerMax[i] = 4;
		attackStateTimer[i] = 0;
		i++;
		#endregion
		
		#region Fly Away Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 80;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Arrow Arrow Variables
		moveSpeed = 3.5;
		decelStart = .15;
		
		arrowCountMax = 12;
		arrowCount = arrowCountMax;
		
		flySpeed = 1;
		flyAccel = .075;
		#endregion
		
		#region Arrow Arrow Start
		sprite_index = spriteSet.sprFly;
		image_index = 0;
		
		dirX = 1;
		if (x >= room_width/2) dirX = -1;
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
			hsp = moveSpeed * dirX;
			moveSpeed -= decelStart;
			
			if (attackStateTimer[attackState] == -1)
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Prepare Arrows
			case 1:
			shakeX = 2;
			
			if (attackStateTimer[attackState] == -1)
			{
				shakeX = 0;
				
				sprite_index = spriteSet.sprArrow;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Shoot Arrows
			case 2:
			hsp = .5 * dirX;
			
			if (attackStateTimer[attackState] == -1)
			{
				with (instance_create_depth(x + (16 * dirX) + irandom_range(-4,4),y + irandom_range(-24,24),depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					knockbackForce = 1;
					sprite_index = spr_MKSS_Attack_StarlessMarx_Arrow1;
					mask_index = spr_MKSS_Attack_StarlessMarx_Arrow1;
					scr_MKSS_Attack_StarlessMarx_Arrow_Setup();
					dmgTarget = 4;
					destroyOutsideRoom = false;
					destroyAfterCollideWall = false;
					angle = 0;
					if (other.dirX == -1) angle = 180;
				}
				
				arrowCount--;
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if (arrowCount <= 0) attackState++;
			}
			break;
			#endregion
			
			#region Fly Away
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprFly;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 4:
			hsp = 6 * dirX;
			vsp = flySpeed;
			flySpeed -= flyAccel * speedMultFinal;
			
			if (attackStateTimer[attackState] == -1) or (y <= -64)
			{
				hsp = 0;
				vsp = 0;
				
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