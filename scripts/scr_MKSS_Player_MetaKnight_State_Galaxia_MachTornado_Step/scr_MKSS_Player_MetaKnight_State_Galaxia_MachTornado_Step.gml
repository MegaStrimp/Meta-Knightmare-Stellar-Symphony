///@description Player - Meta Knight - State - Galaxia - Mach Tornado - Step

function scr_MKSS_Player_MetaKnight_State_Galaxia_MachTornado_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		galaxia_MachTornado_EndTimer = attackCancelTimer;
		
		attackMakeLightInvincible = true;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		scr_MKSS_Player_Component_SlideMovement(galaxia_MachTornado_Movespeed,galaxia_MachTornado_Decel);
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
		if (galaxia_MachTornado_EndTimer != -1)
		{
			galaxia_MachTornado_EndTimer = max(galaxia_MachTornado_EndTimer - speedMultFinal,0);
			if (galaxia_MachTornado_EndTimer == 0)
			{
				attackCancelTimer = 0;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Duck_Step);
				
				galaxia_MachTornado_EndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprAttackGalaxiaMachTornado;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}