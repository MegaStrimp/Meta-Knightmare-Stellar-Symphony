///@description Player - Meta Knight - State - Stun - Step

function scr_MKSS_Player_MetaKnight_State_Stun_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		hsp = 0;
		
		stunEndTimer = 60;
		scr_MKSS_ParticleSet_Stun1(stunEndTimer);
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Shake
		shakeX = 1;
		#endregion
		
		#region Hurt
		//if (hurtState == hurtStates.hurt) stunEndTimer = 0;
		#endregion
		 
		#region Gravity
		scr_MKSS_Player_Component_DuckGravity();
		#endregion
		
		#region Stun End Timer
		if (stunEndTimer != -1)
		{
			stunEndTimer = max(stunEndTimer - speedMultFinal,0);
			if (stunEndTimer == 0)
			{
				shakeX = 0;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				scr_ChangeSprite(spriteSet.sprIdle);
				
				stunEndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprStun;
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}