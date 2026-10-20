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
		clampToRoom = false
		clampToView = false
		
		if (doFlyDown == false)
		{
			if (y < -100)
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
				scr_Enemy_ChangeState_Step(obj_MKSS_Enemy_StarlessMarx,scr_MKSS_Enemy_StarlessMarx_AI_Cutscene_MDStomped_Step)
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
		
		y += vsp * speedMultFinal
	
	}
}