function scr_MKSS_Player_MetaKnight_State_Cutscene_StarlessMarxMDBuzzcut_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
		
		x = obj_MKSS_Enemy_StarlessMarx.x - 20
		y = obj_MKSS_Enemy_StarlessMarx.y
		
		dirX = 1
		
		hsp = 0
		vsp = 0
		
		attackMakeHeavyInvincible = true
	}
	#endregion
	
	if (!localPause)
	{	
		
		#region Animation
		if (!hasAttackAnimation)
		{
			sprite_index = spriteSet.sprAttackBuzzcutSlash1;
			image_index = 0
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}