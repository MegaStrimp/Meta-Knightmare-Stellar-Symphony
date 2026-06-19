///@description MKSS - Enemy - Gigant Edge - AI - Normal - Charge Swing - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_ChargeSwing_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Gigant Edge - Charge Swing";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Ready Timer
		attackStateTimerMax[i] = 70;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Sword Beam Timer
		attackStateTimerMax[i] = 24;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 70;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Charge Swing Start
		sprite_index = spriteSet.sprSwordSwingPrepare;
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
			#region Swing Sword
			case 0:
			if (sprite_index != spriteSet.sprChargeSwingPrepare)
			{
				if (image_index >= image_number-1)
				{
					sprite_index = spriteSet.sprChargeSwingPrepare;
					image_index = 0;
					
					dirX = scr_MKSS_Enemy_DirTarget();	
				}
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprSwordSwing;
				image_index = 0;
				
				scr_PlaySfx(snd_MKSS_Throw);
				
				attackState++;
			}
			break;
			#endregion
			
			#region Sword Beam
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				scr_Camera_SetScreenshake(1,2);
				
				with (instance_create_depth(x+(64*dirX),y,depth + 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					knockbackForce = 1;
					hsp = 1.5*other.dirX;
					vsp = 0;
					dirX = other.dirX;
					image_xscale = dirX * scale;
					sprite_index = spr_MKSS_Attack_GigantEdge_SwordBeam;
					mask_index = spr_MKSS_Attack_GigantEdge_SwordBeam;
					attackAIStep = scr_MKSS_Attack_GigantEdge_SwordBeam_Step;
					destroyOutsideRoom = true;
					destroyAfterCollideWall = true;
				}
				
				attackState++;
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