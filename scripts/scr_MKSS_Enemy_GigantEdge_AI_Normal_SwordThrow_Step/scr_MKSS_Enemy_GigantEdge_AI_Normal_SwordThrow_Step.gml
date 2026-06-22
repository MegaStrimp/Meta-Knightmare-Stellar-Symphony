///@description MKSS - Enemy - Gigant Edge - AI - Normal - Sword Throw - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_SwordThrow_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Gigant Edge - Sword Throw";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Ready Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Throw Start Timer
		attackStateTimerMax[i] = 12;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Throw Timer
		attackStateTimerMax[i] = 95;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Charge Swing Start		
		sprite_index = spriteSet.sprSwordThrowPrepare;
		image_index = 0;
		
		scr_MKSS_UI_ParryIndicator_Create(x - (48 * dirX),y - 12,depth - 1,90,,id)
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
			#region Prepare to Throw Sword
			case 0:
			if (attackStateTimer[attackState] == -1)
			{				
				sprite_index = spriteSet.sprSwordThrow;
				image_index = 0;
				
				scr_PlaySfx(snd_MKSS_Slash2);
				
				attackState++;
			}
			break;
			#endregion
			
			#region Sword Throw
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				var targetAngle = 0;
				if (dirX == -1) targetAngle = 180;
				
				with (instance_create_depth(x + (32 * dirX),y,depth + 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					//canBeParried = isParriable;
					//parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryStarlessMarxCutter"];
					dmg = 1;
					knockbackForce = 1;
					hsp = 0;
					vsp = 0;
					dirX = 1;
					if (targetAngle == 180) dirX = -1;
					image_xscale = dirX * scale;
					sprite_index = spr_MKSS_Attack_GigantEdge_SwordThrow;
					attackAIStep = scr_MKSS_Attack_GigantEdge_SwordThrow_Step;
					
					scr_MKSS_Attack_GigantEdge_SwordThrow_Setup();
									
					angle = targetAngle;
					turnDir = dirX;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Sword Retrieve
			case 2:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprIdle;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 3:
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