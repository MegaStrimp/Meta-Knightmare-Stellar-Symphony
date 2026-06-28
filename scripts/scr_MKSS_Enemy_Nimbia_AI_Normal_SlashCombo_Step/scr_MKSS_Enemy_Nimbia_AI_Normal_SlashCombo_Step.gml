///@description MKSS - Enemy - Nimbia - AI - Normal - Slash Combo - Step

function scr_MKSS_Enemy_Nimbia_AI_Normal_SlashCombo_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Nimbia - Slash Combo";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Slash 1 Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slash 2 Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Thrust Timer
		attackStateTimerMax[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Slash Combo Variables
		thrustStartX = -1;
		thrustEndX = -1;
		
		lightningOffset = 0;
		lightningOffsetDir = choose(-1,1);
		lightningOffsetLimit = 4;
		#endregion
		
		#region Slash Combo Start
		sprite_index = spriteSet.sprSlashPrepare1;
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
			#region Slash 1
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprSlash1;
				image_index = 0;
				
				hsp = 5 * dirX;
				
				scr_PlaySfx(snd_MKSS_Throw);
				
				attackState++;
			}
			break;
			#endregion
			
			#region Slash 2
			case 1:
			if (hsp == 0) dirX = scr_MKSS_Enemy_DirTarget();
			else attackStateTimer[attackState] = attackStateTimerMax[attackState];
			
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprSlash2;
				image_index = 0;
				
				hsp = 5 * dirX;
				
				scr_PlaySfx(snd_MKSS_Throw);
				
				attackState++;
			}
			break;
			#endregion
			
			#region Thrust
			case 2:
			if (hsp == 0) 
			{
				dirX = scr_MKSS_Enemy_DirTarget();
				
				if (thrustEndX == -1)
				{
					sprite_index = spriteSet.sprThrustPrepare1;
					image_index = 0;
					
					thrustEndX = clamp(x+120,arenaLimitLeft,arenaLimitRight);
					
					repeat(point_distance(x,0,thrustEndX,0)/6)
					{
						scr_MKSS_ParticleSet_LightningBall(x+(irandom_range(8,point_distance(x,0,thrustEndX,0))*dirX),y-12+irandom_range(-8,8),random_range(-.3,.3),random_range(-.4,0));
					}
				}
			} else attackStateTimer[attackState] = attackStateTimerMax[attackState];
			
			if (attackStateTimer[attackState] == -1)
			{
				sprite_index = spriteSet.sprThrust1;
				image_index = 0;
				
				thrustStartX = x;
				
				hsp = 21 * dirX;
				
				scr_PlaySfx(snd_MKSS_Throw);
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 3:
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
		x = clamp(x,arenaLimitLeft,arenaLimitRight);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}