///@description MKSS - Enemy - Gigant Edge - AI - Normal - Sword Slam - Step

function scr_MKSS_Enemy_GigantEdge_AI_Normal_SwordSlam_Step()
{
	#region Setup
	if (enemyState_Setup)
	{		
		#region Attack Init
		attackString = "Gigant Edge - Sword Slam";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
		dirX = scr_MKSS_Enemy_DirTarget();
		
		attackState = 0;
		#endregion
		
		#region Attack Timers
		var i = 0;
		
		#region Ready Timer
		attackStateTimerMax[i] = 40;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Jump Timer
		attackStateTimerMax[i] = 50;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Slam Timer
		attackStateTimerMax[i] = 300;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		
		#region Revert Timer
		attackStateTimerMax[i] = 70;
		attackStateTimer[i] = attackStateTimerMax[i];
		i++;
		#endregion
		#endregion
		
		#region Sword Slam Variables		
		swordSlam_JumpSpeed = 1.25;
		swordSlam_JumpHeight = -6.5;
		#endregion
		
		#region Sword Slam Start
		sprite_index = spriteSet.sprSwordSlamPrepare;
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
			#region Duck
			case 0:
			if (attackStateTimer[attackState] == -1)
			{				
				hsp = swordSlam_JumpSpeed * dirX;
				vsp = swordSlam_JumpHeight;
				
				sprite_index = spriteSet.sprSwordSlamJump;
				image_index = 0;
				
				var sfx = scr_PlaySfx(snd_MKSS_GigantEdge_Dash1);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				attackState++;
			}
			break;
			#endregion
			
			#region Jumping Up
			case 1:
			hsp = swordSlam_JumpSpeed * dirX;
			vsp = scr_Entity_Friction(vsp,grav * speedMultFinal);
			
			if (attackStateTimer[attackState] == -1)
			{				
				attackState++;
			}
			break;
			#endregion
			
			#region Slamming Down
			case 2:
			hsp = swordSlam_JumpSpeed * dirX;
			
			if (attackStateTimer[attackState] == -1) or ((grounded) and (attackStateTimer[attackState] != attackStateTimerMax[attackState]))
			{			
				scr_Camera_SetScreenshake(3,1);
				
				sprite_index = spriteSet.sprSwordSlamDuck;
				image_index = 0;
				
				var sfx = scr_PlaySfx(snd_MKSS_GigantEdge_Impact);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				hsp = 0;
				vsp = 0;
				
				attackState++;
			}
			break;
			#endregion
			
			#region Finish Attack
			case 3:
			if (attackStateTimer[attackState] == -1)
			{
				scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_GigantEdge_AI_Normal_SheathSword_Step);
			}
			break;
			#endregion
		}
		#endregion
		
		#region Gravity
		if (attackState != 1) vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Attack State Timer
		scr_MKSS_Enemy_AttackStateTimer();
		#endregion
	}
}