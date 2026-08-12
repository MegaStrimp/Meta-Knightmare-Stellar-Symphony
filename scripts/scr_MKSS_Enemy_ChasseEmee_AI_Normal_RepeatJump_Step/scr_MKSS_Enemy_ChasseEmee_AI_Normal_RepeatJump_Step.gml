///@description MKSS - Enemy - Chasse Emee - AI - Normal - Repeat Jump - Step

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_RepeatJump_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Chasse-Emee - Repeat Jump";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Prepare Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Duck Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Jump Timer
		attackStateTimerMax[i] = 120;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Repeat Jump Variables
		hasCollision = true;
		
		jumpSpeed = 2 + (irandom_range(-3,3) / 10);
		jumpHeight = -4;
		
		xStart = x;
		if (dirX == -1) xStart = room_width-xStart;
		dirXStart = dirX;
		#endregion
		
		#region Repeat Jump Start
		sprite_index = spriteSet.sprShake;
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
				
				sprite_index = spriteSet.sprDuck;
				image_index = 0;
		
				attackState++;
			}
			break;
			#endregion
			
			#region Duck
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				
				sprite_index = spriteSet.sprLookDown;
				image_index = 0;
				
				vsp = jumpHeight;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Jump
			case 2:
			hsp = jumpSpeed * dirX;
			
			if (grounded) and (vsp >= 0)
			{
				hsp = 0;
				vsp = 0;
				
				sprite_index = spriteSet.sprDuck;
				image_index = 0;
				
				shakeX = (attackStateTimerMax[attackState - 1] / 10) - 1;
				
				scr_Camera_SetScreenshake(2,1);
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if ((dirX == -1) and (x <= xStart)) or ((dirX == 1) and (x >= room_width - xStart))
				{
					attackState++;
				}
				else attackState--;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				dirX = -dirXStart;
				
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
					
				if ((dirX == -1) and (x <= room_width - xStart)) or ((dirX == 1) and (x >= xStart))
				{
					hsp = 0;
					
					x = xStart;
					if (dirX == -1) x = room_width - xStart;
					
					scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
				} 
				else hsp = 3 * dirX;
			}
			break;
			#endregion
		}
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(hasCollision,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}