///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Cross Slash - Step

function scr_MKSS_Enemy_Andromeda1_AI_Normal_CrossSlash_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Andromeda - Cross Slash";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Indicator Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slash Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Post-Slash Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Cross Slash Variables
		slashCountMax = 2;
		slashCount = slashCountMax;
		#endregion
		
		#region Cross Slash Start
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		
		slashList = ds_list_create();
		
		arm[0] = true;
		arm[1] = true;
		
		armLB.sprite_index = spriteSet.sprArmLB_SlashPrepare;
		armLB.image_index = 0;
		
		armRB.sprite_index = spriteSet.sprArmRB_SlashPrepare;
		armRB.image_index = 0;
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
			#region Indicator
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				var _offset = irandom_range(-5,5);
				if (slashCount != 1)
				{
					with (instance_create_depth(obj_Player.x,obj_Player.y,depth + 6,obj_MKSS_Attack))
					{
						owner = other.id;
						isEnemy = true;
						dmg = -1;
						dmgTarget = 20;
						scr_MKSS_Attack_Andromeda1_StarSlash_Setup();
						slashAngle = 90 + _offset;
						gashEndTimer = 60;
						ds_list_add(other.slashList,id);
					}
					with (instance_create_depth(obj_Player.x,obj_Player.y,depth + 6,obj_MKSS_Attack))
					{
						owner = other.id;
						isEnemy = true;
						dmg = -1;
						dmgTarget = 20;
						scr_MKSS_Attack_Andromeda1_StarSlash_Setup();
						slashAngle = 180 + _offset;
						gashEndTimer = 60;
						ds_list_add(other.slashList,id);
					}
				}
				else
				{
					with (instance_create_depth(obj_Player.x,obj_Player.y,depth + 6,obj_MKSS_Attack))
					{
						owner = other.id;
						isEnemy = true;
						dmg = -1;
						dmgTarget = 20;
						scr_MKSS_Attack_Andromeda1_StarSlash_Setup();
						slashAngle = 45 + _offset;
						gashEndTimer = 60;
						ds_list_add(other.slashList,id);
					}
					with (instance_create_depth(obj_Player.x,obj_Player.y,depth + 6,obj_MKSS_Attack))
					{
						owner = other.id;
						isEnemy = true;
						dmg = -1;
						dmgTarget = 20;
						scr_MKSS_Attack_Andromeda1_StarSlash_Setup();
						slashAngle = 135 + _offset;
						gashEndTimer = 60;
						ds_list_add(other.slashList,id);
					}
				}
				
				slashCount--;
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Slash
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				armLB.sprite_index = spriteSet.sprArmLB_Slash;
				armLB.image_index = 0;
				
				armRB.sprite_index = spriteSet.sprArmRB_Slash;
				armRB.image_index = 0;
		
				var i = 0;
				repeat(ds_list_size)
				{
					if (instance_exists(ds_list_find_value(slashList,i))) ds_list_find_value(slashList,i).slashState = 1;
					
					i++;
				}
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				attackState++;
			}
			break;
			#endregion
			
			#region Post-Slash
			case 2:
			if (attackStateTimer[attackState] == -1)
			{
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if (slashCount <= 0) attackState++;
				else attackState = 0;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				ds_list_clear(slashList);
				
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Collision
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}