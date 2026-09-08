///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Star Slash - Step

function scr_MKSS_Enemy_Andromeda1_AI_Normal_StarSlash_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Andromeda - Star Slash";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Indicator Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slash Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Star Slash Variables
		slashCountMax = 2;
		slashCount = slashCountMax;
		#endregion
		
		#region Star Slash Start
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		
		slashList = ds_list_create();
		
		//arm[0] = true;
		//arm[1] = true;
		
		//armLBOffsetX = -26;
		//armLBOffsetY = -14;
		//armLBAngle = -130;
		armLB.sprite_index = spriteSet.sprArmLB_SlashPrepare;
		armLB.image_index = 0;
		
		//armRBOffsetX = 22;
		//armRBOffsetY = -14;
		//armRBAngle = 180;
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
				with (instance_create_depth(obj_Player.x,0,depth + 6,obj_MKSS_Attack))
				{
					owner = other.id;
					isEnemy = true;
					dmg = -1;
					dmgTarget = 20;
					scr_MKSS_Attack_Andromeda1_StarSlash_Setup();
					ds_list_add(other.slashList,id);
				}
				
				slashCount--;
				
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if (slashCount <= 0) attackState++;
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
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 2:
			if (hsp != 0) 
			{
				var decelFinal = decelThrust * speedMultFinal;
		
				hsp = scr_Entity_Friction(hsp,decelFinal);
				
				repeat(4) 
				{
					scr_MKSS_ParticleSet_LightningBall(x-(irandom_range(-3,6)*dirX),y-12+lightningOffset);
					lightningOffset += lightningOffsetDir;
					if (lightningOffset <= -lightningOffsetLimit) lightningOffsetDir = 1;
					if (lightningOffset >= lightningOffsetLimit) lightningOffsetDir = -1;
				}
			}
			
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