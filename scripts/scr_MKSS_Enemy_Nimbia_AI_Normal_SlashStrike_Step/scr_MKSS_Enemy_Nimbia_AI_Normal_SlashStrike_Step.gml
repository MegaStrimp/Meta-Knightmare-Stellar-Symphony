///@description MKSS - Enemy - Nimbia - AI - Normal - Slash Strike - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_SlashStrike_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Slash Strike";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Prepare Timer
		attackStateTimerMax[i] = 12;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Parry Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slash Timer
		attackStateTimerMax[i] = 25;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Strike Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 75;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Slash Strike Variables
		prevHp = hp;
		#endregion
		
		#region Slash Strike Start
		sprite_index = spriteSet.sprSlashPrepare3;
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
			#region Start
			case 0:
			if (attackStateTimer[attackState] == -1)
			{		
				prevHp = hp;
				
				prevDefense = defense;
				defense = 3;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Parry
			case 1:
			if (attackStateTimer[attackState] == -1) or (hp < prevHp)
			{
				dirX = scr_MKSS_Enemy_DirTarget();
				
				defense = prevDefense;
				
				sprite_index = spriteSet.sprSlash4;
				image_index = 0;
				
				hsp = 5 * dirX;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Strike Prepare
			case 2:
			if (attackStateTimer[attackState] == -1)
			{
				dirX = scr_MKSS_Enemy_DirTarget();
				
				sprite_index = spriteSet.sprLightningStrikePrepare1;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Strike
			case 3:
			if (attackStateTimer[attackState] == -1)
			{				
				sprite_index = spriteSet.sprLightningStrike1;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 4:
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