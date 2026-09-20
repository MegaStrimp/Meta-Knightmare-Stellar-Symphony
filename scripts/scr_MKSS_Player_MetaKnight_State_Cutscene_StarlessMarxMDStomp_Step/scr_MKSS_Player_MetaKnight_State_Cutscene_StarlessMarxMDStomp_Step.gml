function scr_MKSS_Player_MetaKnight_State_Cutscene_StarlessMarxMDStomp_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
		
		dirX = 1
		
		hsp = 0
		vsp = -4
		
		attackMakeHeavyInvincible = true
		
		doFlyDown = false
	}
	#endregion
	
	if (!localPause)
	{
		scr_MKSS_Player_Component_Movement()
	
		if (doFlyDown == false)
		{
			if (y < 20)
			{
				vsp = 4
				doFlyDown = true
				x = obj_MKSS_Enemy_StarlessMarx.x
			}
		}
		else
		{
			if (place_meeting(x,y,obj_MKSS_Enemy_StarlessMarx))
			{
				obj_MKSS_Enemy_StarlessMarx.vsp = 4
				vsp = 0
			}
		}
	
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprAttackGalaxiaStab;
			image_index = 0
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}