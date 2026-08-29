///@description MKSS - Enemy - Grand Wheelie - AI - Normal - Big Rush Intro - Step

function scr_MKSS_Enemy_GrandWheelie_AI_Normal_BigRushIntro_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Miniboss Setup
		if ((isBoss) and (isBossSetup))
		{
			scr_MKSS_Enemy_Miniboss_Setup(playBossTheme);
			scr_MKSS_MarkBoss(id);
			scr_MKSS_Enemy_HealthbarFill_Setup(id);
			
			isBossSetup = false;
		}
		#endregion
		
		#region Attack Init
		attackString = "Grand Wheelie - Big Rush Intro";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Revert Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Physics Variables
		movespeed = movespeedBase * (1 + (chargeMult)) * speedMultFinal;
		accel = accelBase * (1 + (chargeMult)) * speedMultFinal;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Attack States
		switch (attackState)
		{
			#region Revert
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Movement
		scr_Component_WalkAndTurn_Step();
		#endregion
		
		#region Wall Detection
		if ((!isTurning) and (position_meeting(x + (dirX * floor(global.gameTileSize / 2)),y - 8,obj_Wall)))
		{
			dirX *= -1;
			isTurning = true;
			
			sprite_index = spriteSet.sprTurn;
			image_index = 0;
		}
		#endregion
				
		#region Afterimage
		if (afterimageTimer == -1) afterimageTimer = afterimageTimerMax;
		#endregion
		
		#region Friction
		var decelFinal = decel * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Afterimage Timer
		if (afterimageTimer != -1)
		{
			afterimageTimer = max(afterimageTimer - speedMultFinal,0);
			if (afterimageTimer == 0)
			{
				scr_MKSS_ParticleSet_Afterimage();
				
				afterimageTimer = -1;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			if (isTurning)
			{
				sprite_index = spriteSet.sprTurn;
			}
			else
			{
				sprite_index = spriteSet.sprWalk;
			}
		}
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}