///@description MKSS - Enemy - Bouncy Sis - AI - Walk - Spin - Step

function scr_MKSS_Enemy_BouncySis_AI_Walk_Spin_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		#region Variables
		attackString = "Bouncy Sis - Spin";
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		heartTimer = 0;
		#endregion
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		if (!grounded) scr_Component_BasicHorizontal_Step(true);
		#endregion
		
		#region Grounded
		if (grounded)
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
			
			with (obj_Player)
			{
				if (grounded)
				{
					vsp = -3 * dirY * speedMultFinal;
					
					scr_Camera_SetScreenshake(2,0);
					
					var sfx = scr_PlaySfx(snd_MKSS_Hurt);
					audio_sound_pitch(sfx,random_range(.85,1.15));
					
					script_execute_ext(playerGetHit,[id,10]);
					scr_MKSS_Player_GetStunned(id);
				}
			}
			
			hsp = 0;
			image_index = 0;
			
			dirX = scr_MKSS_Enemy_DirTarget();
			
			scr_Component_BasicHorizontal_Setup(movespeedNormal);
			scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
		}
		#endregion
		
		#region Revert If Hurt
		if (hasKnockback)
		{
			scr_Component_BasicHorizontal_Setup(movespeedNormal);
			scr_Enemy_ChangeState_Step(id,enemyAIStepIdle);
			
			attackIndex = -1;
		}
		#endregion
		
		#region Gravity
		vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
		#endregion
		
		#region Friction
		if (grounded)
		{
			var decelFinal = decel * speedMultFinal;
			
			hsp = scr_Entity_Friction(hsp,decelFinal);
		}
		#endregion
		
		#region Heart Timer
		if (heartTimer != -1)
		{
			heartTimer = max(heartTimer - speedMultFinal,0);
			if (heartTimer == 0)
			{
				scr_MKSS_ParticleSet_BouncyHearts(x + irandom_range(-4,4),y - 4 + irandom_range(-4,4),depth);
				
				heartTimer = heartTimerMax;
			}
		}
		#endregion
			
		#region Collision
		scr_Entity_Collision(,enemyWallXCollision,enemyWallYCollision);
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprSpinJump;
		#endregion
	}
}