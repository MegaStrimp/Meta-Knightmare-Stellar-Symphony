///@description MKSS - Enemy - Nimbia - AI - Normal - Sword Form - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_SwordForm_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Sword Form";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Transform Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Sword Form Variables
		hasGravity = false;
		
		yTop = y-64;
		
		swordIdLeft = -1;
		swordIdRight = -1;
		#endregion
		
		#region Sword Form Start
		sprite_index = spriteSet.sprSwordForm;
		image_index = 0;
		
		dirX = 1;
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
			#region Transform
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				vsp = -2;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Post-Transform
			case 1:
			if (y <= yTop) and (vsp != 0)
			{
				y = yTop;
				
				vsp = 0;
			}
			
			if (attackStateTimer[attackState] == -1) or (image_index >= 17)
			{
				mask_index = spriteSet.sprSwordForm;
				
				repeat(2)
				{
					with (instance_create_depth(x+22,y+8,depth - 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = true;
						dmg = 1;
						sprite_index = spr_MKSS_Attack_Nimbia_SwordForm;
						mask_index = spr_MKSS_Attack_Nimbia_SwordForm;
						scr_MKSS_Attack_Nimbia_SwordForm_Setup();
						offsetXDefault = 22;
						offsetYDefault = 8;
						offsetX = offsetXDefault;
						offsetY = offsetYDefault;
					}
					with (instance_create_depth(x-24,y+8,depth - 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = true;
						dmg = 1;
						sprite_index = spr_MKSS_Attack_Nimbia_SwordForm;
						mask_index = spr_MKSS_Attack_Nimbia_SwordForm;
						scr_MKSS_Attack_Nimbia_SwordForm_Setup();
						dirX = -1;
						image_xscale = dirX;
						offsetXDefault = -24;
						offsetYDefault = 8;
						offsetX = offsetXDefault;
						offsetY = offsetYDefault;
					}
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Sword
			case 2:
			if (y <= yTop) and (vsp != 0)
			{
				y = yTop;
				
				vsp = 0;
			}
				
			if (attackStateTimer[attackState] == -1)
			{
				
			}
			break;
			#endregion
			
			#region Finish Attack
			case 6:
			if (attackStateTimer[attackState] == -1)
			{
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