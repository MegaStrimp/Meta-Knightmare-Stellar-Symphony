///@description MKSS - Enemy - Grand Wheelie - AI - Normal - Jump - Step

function scr_MKSS_Enemy_GrandWheelie_AI_Normal_Jump_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Attack Init
		attackString = "Grand Wheelie - Jump";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Start Timer
		attackStateTimerMax[i] = 90;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 1200;
		attackStateTimerMin[i] = 30;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Attack Variables
		gravityTimer = -1;
		gravityTimerMax = 15;
		#endregion
		
		scr_MKSS_UI_ParryIndicator_Create(x,y - 6,depth - 1,attackStateTimer[0],,id,id);
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Attack States
		switch (attackState)
		{
			#region Jump
			case 0:
			if (attackStateTimer[attackState] == -1)
			{
				var sfx = scr_PlaySfx(snd_MKSS_EnemyJump);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				var angle = 90 + (20 * dirX);
				scr_MKSS_ParticleSet_Jump(x - (7 * dirX),y + 5,angle);
				
				vsp = -jumpspeed * dirY * speedMultFinal;
				grounded = false;
				
				gravityTimer = gravityTimerMax;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Revert
			case 1:
			if ((grounded) and (attackStateTimer[attackState] > attackStateTimerMin[attackState]))
			{
				var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				scr_Camera_SetScreenshake(0,2);
				
				var parAngle = irandom_range(0,359);
				var parScaleDir = 1;
				if ((parAngle > 90) and (parAngle <= 270))
				{
					parScaleDir = -1;
				}
				
				scr_MKSS_ParticleSet_FallDuck(x,y,parScaleDir,parAngle);
				scr_MKSS_ParticleSet_Run(x + 16,y + 16,-1);
				scr_MKSS_ParticleSet_Run(x - 16,y + 16,1);
					
				attackStateTimer[attackState] = attackStateTimerMin[attackState];
			}
			
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
		
		#region Friction
		var decelFinal = decel * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
		#endregion
		
		#region Gravity
		if (gravityTimer == -1)
		{
			vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		}
		else
		{
			vsp = min(0,scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal));
		}
		#endregion
		
		#region Gravity Timer
		if (gravityTimer != -1)
		{
			if (vsp >= 0)
			{
				gravityTimer = max(gravityTimer - speedMultFinal,0);
				if (gravityTimer == 0)
				{
					var sfx = scr_PlaySfx(snd_MKSS_RunBegin);
					audio_sound_pitch(sfx,random_range(.85,1.15));
					
					scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
					
					gravityTimer = -1;
				}
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