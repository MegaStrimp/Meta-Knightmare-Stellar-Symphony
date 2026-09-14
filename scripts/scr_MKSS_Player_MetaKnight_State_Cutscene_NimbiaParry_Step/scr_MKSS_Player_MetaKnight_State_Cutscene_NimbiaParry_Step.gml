function scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaParry_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
		
		parryTimer = 90
		
		flashTimer = 30
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		scr_MKSS_Player_Component_Movement();
		#endregion
		
		if (parryTimer != -1)
		{
			parryTimer = max(parryTimer - speedMultFinal,0);
			if (parryTimer == 0)
			{	
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				
				parryTimer = -1;
			}
		}
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprAttackGalaxiaSlash1;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}