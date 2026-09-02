///@description Player - Meta Knight - State - Cutscene - Chasse-Emee - Slide - Step

function scr_MKSS_Player_MetaKnight_State_Cutscene_ChasseEmee_Slide_Step(targetSlideEndTimer = 20)
{
	#region Setup
	if (playerState_Setup)
	{
		slideAccelTimer = floor(targetSlideEndTimer / 1.5);
		slideEndTimer = targetSlideEndTimer;
		
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
		
		#region Slide End Timer
		if (slideEndTimer != -1)
		{
			slideEndTimer = max(slideEndTimer - speedMultFinal,0);
			if (slideEndTimer == 0)
			{
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Cutscene_ChasseEmee_Step);
				
				slideEndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprSlide;
			image_index = (slideAccelTimer == -1);
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}