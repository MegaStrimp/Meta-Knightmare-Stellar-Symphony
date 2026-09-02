///@description Player - Meta Knight - State - Cutscene - Chasse-Emee - Dodge - Step

function scr_MKSS_Player_MetaKnight_State_Cutscene_ChasseEmee_Dodge_Step(targetDodgeEndTimer = 20)
{
	#region Setup
	if (playerState_Setup)
	{
		slideAccelTimer = -1;
		dodgeEndTimer = targetDodgeEndTimer;
		
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
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_ChasseEmee_Step);
				
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