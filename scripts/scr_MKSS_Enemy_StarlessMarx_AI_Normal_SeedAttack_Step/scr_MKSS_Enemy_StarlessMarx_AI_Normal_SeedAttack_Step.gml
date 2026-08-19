///@description MKSS - Enemy - Starless Marx - AI - Normal - Seed Attack - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_SeedAttack_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Starless Marx - Seed Attack";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Start Timer
		attackStateTimerMax[i] = 60;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Seed Timer
		attackStateTimerMax[i] = 20;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Seed Spread Timer
		attackStateTimerMax[i] = 80;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 120;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Seed Attack Variables
		flySpeed = 2;
		flyAccel = .2;
		
		seedDir = choose(-1,1);
		seedCount = 4;
		seedAdd = 0;
		seedStartX = 32;
		if (seedDir == -1) seedStartX = room_width - seedStartX;
		seedOffsetX = 64;
		
		spreadCount = 5;
		spreadStartX = 0;
		spreadOffsetX = seedOffsetX;
		#endregion
		
		#region Seed Attack Start
		sprite_index = spriteSet.sprFlyUp;
		image_index = 0;
		
		scr_PlaySfx(snd_MKSS_MarxLaugh3);
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
			if (y > -96) 
			{
				vsp = flySpeed;
				flySpeed -= flyAccel * speedMultFinal;
			}
			else vsp = 0;
			
			if (attackStateTimer[attackState] == -1)
			{
				vsp = 0;
				y = -96;
				
				canBeHit = false;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Seed
			case 1:
			if (attackStateTimer[attackState] == -1)
			{
				with (instance_create_depth(seedStartX + (seedOffsetX * (seedAdd * seedDir)) + irandom_range(-6,6),-6,depth - 1,obj_MKSS_Attack))
				{
					owner = other;
					isEnemy = true;
					dmg = -1;
					knockbackForce = 1;
					sprite_index = spr_MKSS_Attack_StarlessMarx_Seed;
					mask_index = spr_MKSS_Attack_StarlessMarx_Seed;
						pauseOutsideView = false;
					destroyOutsideRoom = false;
					destroyAfterCollideWall = false;
					scr_MKSS_Attack_StarlessMarx_Seed_Setup();
					dmgTarget = 4;
				}
				
				seedAdd++;
				seedCount--;
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if (seedCount <= 0) attackState++;
			}
			break;
			#endregion
			
			#region Seed Spread
			case 2:
			if (attackStateTimer[attackState] == -1)
			{
				var i = 0;
				repeat(spreadCount)
				{
					with (instance_create_depth(clamp(spreadStartX + (spreadOffsetX * i) + irandom_range(-6,6),0,room_width),-6 - irandom_range(0,32),depth - 1,obj_MKSS_Attack))
					{
						owner = other;
						isEnemy = true;
						dmg = -1;
						knockbackForce = 1;
						sprite_index = spr_MKSS_Attack_StarlessMarx_Seed;
						mask_index = spr_MKSS_Attack_StarlessMarx_Seed;
						pauseOutsideView = false;
						destroyOutsideRoom = false;
						destroyAfterCollideWall = false;
						scr_MKSS_Attack_StarlessMarx_Seed_Setup();
						dmgTarget = 4;
					}
					
					i++;
				}
				
				seedAdd = 0;
				seedCount--;
				attackStateTimer[attackState] = attackStateTimerMax[attackState];
				if (seedCount <= 0) attackState++;
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
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}