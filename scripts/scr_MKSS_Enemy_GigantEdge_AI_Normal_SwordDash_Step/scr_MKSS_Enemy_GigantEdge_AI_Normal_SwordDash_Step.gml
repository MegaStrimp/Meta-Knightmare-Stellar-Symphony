///@description MKSS - Enemy - Gigant Edge - AI - Normal - Sword Dash - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_SwordDash_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Gigant Edge - Sword Dash";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Walk Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Ready Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Charge Timer
		attackStateTimerMax[i] = 180;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Sword Dash Variables
		swordDash_Accel = .1;
		swordDash_Speed = 0;
		swordDash_SpeedMax = 2.5;
		
		meleeHitbox = -1;
		#endregion
		
		#region Sword Dash Start
		sprite_index = spriteSet.sprWalk;
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
			#region Walk Back
			case 0:
			hsp = -.25 * dirX;
			
			if (attackStateTimer[attackState] == -1)
			{
				hsp = 0;
				
				sprite_index = spriteSet.sprSwordDashPrepare;
				image_index = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Ready Sword
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprSwordDash;
				image_index = 0;
				
				hsp = swordDash_Accel * dirX;
				
				with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					knockbackForce = 1;
					attackAIStep = scr_MKSS_Attack_GigantEdge_MeleeHitbox_Step;
					dirX = other.dirX;
					image_xscale = dirX * other.scale;
					sprite_index = -1;
					mask_index = spr_MKSS_Attack_GigantEdge_MeleeHitbox_SwordDash;
					destroyTimer = 3;
					
					other.meleeHitbox = id;
				}	
				
				attackState++;
			}
			break;
			#endregion
			
			#region Dashing
			case 2:
			with (meleeHitbox)
			{
				destroyTimer = 3;
			}
			
			swordDash_Speed = min(swordDash_Speed + (swordDash_Accel * speedMultFinal), swordDash_SpeedMax);
			
			hsp = swordDash_Speed * dirX;
			
			if (instance_place(x + hsp,y,obj_Wall))
			{
				hsp = -2 * dirX;
				vsp = -2;
				
				scr_Camera_SetScreenshake(2,1);
				
				sprite_index = spriteSet.sprHurt1;
				image_index = 0;
				
				with (meleeHitbox)
				{
					instance_destroy();
				}
				
				attackState++;
			}
			
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprSwordGrab;
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