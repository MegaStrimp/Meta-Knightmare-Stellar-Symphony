///@description MKSS - Enemy - Starless Marx - AI - Normal - Ice Bomb - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_IceBomb_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Starless Marx - Ice Bomb";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Start Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Bomb Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Parry Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 80;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Ice Bomb Variables
		parryBack = 1;
		iceBomb = -1;
		
		wingOutTimerMax = 8;
		wingOutTimer = -1;
		#endregion
		
		#region Ice Bomb Start
		sprite_index = spriteSet.sprCloseWing;
		image_index = 0;
		
		scr_MKSS_UI_ParryIndicator_Create(x,y + 8,depth - 1,attackStateTimerMax[attackState] + attackStateTimerMax[attackState+1]);
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
			if (y < 72) vsp = 2;
			else vsp = 0;
			
			if (attackStateTimer[attackState] == -1)
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Bomb
			case 1:
			shakeX = 2;
			
			if (attackStateTimer[attackState] == -1)
			{
				scr_PlaySfx(snd_MKSS_MarxIceBombDrop);
				
				vsp = -1;
				
				shakeX = 0;
				
				sprite_index = spriteSet.sprBomb;
				image_index = 0;
				
				with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = 1;
					knockbackForce = 1;
					hsp = 0;
					vsp = 6;
					sprite_index = spr_MKSS_Attack_StarlessMarx_IceBomb;
					mask_index = spr_MKSS_Attack_StarlessMarx_IceBomb;
					attackAIStep = scr_MKSS_Attack_StarlessMarx_IceBomb_Step;
					destroyOutsideRoom = true;
					destroyAfterCollideWall = false;
					canBeParried = true;
					parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryIceBomb"];
					other.iceBomb = id;
				}
				
				attackState++;
			}
			break;
			#endregion
			
			#region Parry
			case 2:
			if (wingOutTimer != -1)
			{
				wingOutTimer = max(wingOutTimer - speedMultFinal,0);
				if (wingOutTimer == 0)
				{
					sprite_index = spriteSet.sprIdle;
					image_index = 0;
							
					wingOutTimer = -1;
				}
			}
			
			if (attackStateTimer[attackState] == -1) or ((!instance_exists(iceBomb)) and (parryBack > 0))
			{
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 3:
			if (wingOutTimer != -1)
			{
				wingOutTimer = max(wingOutTimer - speedMultFinal,0);
				if (wingOutTimer == 0)
				{
					sprite_index = spriteSet.sprIdle;
					image_index = 0;
							
					wingOutTimer = -1;
				}
			}
			
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