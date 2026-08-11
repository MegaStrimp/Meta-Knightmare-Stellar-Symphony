///@description Player - Meta Knight - State - Buzzcut - Finisher - Step

function scr_MKSS_Player_MetaKnight_State_Buzzcut_Finisher_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		buzzcut_Finisher_EndTimer = attackCancelTimer;
		
		attackMakeLightInvincible = true;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Decelerate
		hsp = scr_Entity_Friction(hsp,(decel / 2) * speedMultFinal);
		#endregion
		
		#region Gravity
		scr_MKSS_Player_Component_Gravity();
		#endregion
		
		#region Hurt
		if (hurtState == hurtStates.hurt) buzzcut_Finisher_EndTimer = 0;
		#endregion
		
		#region Buzzcut - Circle Slash - End Timer
		if (buzzcut_Finisher_EndTimer != -1)
		{
			buzzcut_Finisher_EndTimer = max(buzzcut_Finisher_EndTimer - speedMultFinal,0);
			if (buzzcut_Finisher_EndTimer == 0)
			{
				attackCancelTimer = 0;
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				
				buzzcut_Finisher_EndTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		if (!hasAttackAnimation)
		{
			//sprite_index = spriteSet.sprAttackBuzzcutFinisher; STRIMPTODO
			sprite_index = spriteSet.sprAttackBuzzcutChainlings;
			image_index = 0;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}