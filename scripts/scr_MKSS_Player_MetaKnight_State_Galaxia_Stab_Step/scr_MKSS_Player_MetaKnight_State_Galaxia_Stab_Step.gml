///@description Player - Meta Knight - State - Galaxia - Stab - Step

function scr_MKSS_Player_MetaKnight_State_Galaxia_Stab_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		slideAccelTimer = floor(attackCancelTimer / 4);
		galaxia_Stab_EndTimer = attackCancelTimer;
		
		attackMakeLightInvincible = true;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		scr_MKSS_Player_Component_SlideMovement(galaxia_Stab_Movespeed,galaxia_Stab_Decel);
		#endregion
		
		#region Gravity
		scr_MKSS_Player_Component_DuckGravity();
		#endregion
		
		#region Hurt
		if (hurtState == hurtStates.hurt) galaxia_DownThrust_EndTimer = 0;
		#endregion
		
		#region Slide Accel Timer
		if (slideAccelTimer != -1)
		{
			slideAccelTimer = max(slideAccelTimer - speedMultFinal,0);
			if (slideAccelTimer == 0)
			{
				slideAccelTimer = -1;
			}
		}
		#endregion
		
		#region Galaxia - Down Thrust - End Timer
		if (galaxia_Stab_EndTimer != -1)
		{
			galaxia_Stab_EndTimer = max(galaxia_Stab_EndTimer - speedMultFinal,0);
			if (galaxia_Stab_EndTimer == 0)
			{
				attackCancelTimer = 0;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Duck_Step);
				
				galaxia_Stab_EndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprAttackGalaxiaStab;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}