function scr_MKSS_Player_MetaKnight_State_Cutscene_StarlessMarxMDSlash_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
		
		maxSlashDuration = 30
		slashTimer = 0
		
		y = obj_MKSS_Enemy_StarlessMarx.y
		
		attackMakeHeavyInvincible = true
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		slideAccelTimer = -1
		scr_MKSS_Player_Component_SlideMovement();
		#endregion
		
		if (slashTimer != -1)
		{
			slashTimer = max(slashTimer - speedMultFinal,0);
			if (slashTimer == 0)
			{	
				slashTimer = maxSlashDuration
				if (x > obj_MKSS_Enemy_StarlessMarx.x)
				{
					//x = obj_MKSS_Enemy_StarlessMarx.x - 30
					hsp = -2
					dirX = -1
				}
				else
				{
					//x = obj_MKSS_Enemy_StarlessMarx.x + 30
					hsp = 2
					dirX = 1
				}
				x = obj_MKSS_Enemy_StarlessMarx.x
				y -= 5
				obj_MKSS_Enemy_StarlessMarx.y -= 5
			}
		}
		
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