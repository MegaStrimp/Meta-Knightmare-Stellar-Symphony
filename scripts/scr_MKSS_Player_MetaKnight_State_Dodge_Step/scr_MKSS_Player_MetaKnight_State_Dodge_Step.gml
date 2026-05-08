///@description Player - Meta Knight - State - Dodge - Step

function scr_MKSS_Player_MetaKnight_State_Dodge_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		slideAccelTimer = floor(attackCancelTimer / 2);
		dodgeEndTimer = 20;
		attackMakeLightInvincible = true; //IF HAS UPGRADE
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		scr_MKSS_Player_Component_SlideMovement();
		#endregion
		
		#region Gravity
		scr_MKSS_Player_Component_DuckGravity();
		#endregion
		
		#region Hurt
		if (hurtState == hurtStates.hurt) dodgeEndTimer = 0;
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
		
		#region Dodge End Timer
		if (dodgeEndTimer != -1)
		{
			dodgeEndTimer = max(dodgeEndTimer - speedMultFinal,0);
			if (dodgeEndTimer == 0)
			{
				attackMakeLightInvincible = false;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				
				dodgeEndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			if (grounded)
			{
				sprite_index = spriteSet.sprParry;
			}
			else
			{
				sprite_index = spriteSet.sprFloat;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}