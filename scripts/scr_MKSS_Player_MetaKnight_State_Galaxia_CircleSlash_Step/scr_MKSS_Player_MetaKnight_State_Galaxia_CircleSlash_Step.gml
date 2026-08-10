///@description Player - Meta Knight - State - Galaxia - Circle Slash - Step

function scr_MKSS_Player_MetaKnight_State_Galaxia_CircleSlash_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		galaxia_CircleSlash_EndTimer = attackCancelTimer;
		
		attackMakeLightInvincible = true;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Gravity
		scr_MKSS_Player_Component_Gravity();
		#endregion
		
		#region Hurt
		if (hurtState == hurtStates.hurt) galaxia_CircleSlash_EndTimer = 0;
		#endregion
		
		#region Galaxia - Circle Slash - End Timer
		if (galaxia_CircleSlash_EndTimer != -1)
		{
			galaxia_CircleSlash_EndTimer = max(galaxia_CircleSlash_EndTimer - speedMultFinal,0);
			if (galaxia_CircleSlash_EndTimer == 0)
			{
				attackCancelTimer = 0;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				
				galaxia_CircleSlash_EndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprAttackGalaxiaCircleSlash;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}