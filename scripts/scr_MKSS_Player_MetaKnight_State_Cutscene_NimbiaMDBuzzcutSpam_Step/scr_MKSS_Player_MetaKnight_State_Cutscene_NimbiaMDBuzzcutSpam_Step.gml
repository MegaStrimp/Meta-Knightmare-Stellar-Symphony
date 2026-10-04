function scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDBuzzcutSpam_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
		
		x = obj_MKSS_Enemy_Nimbia.x - 100
		
		dirX = 1
		
		hsp = 0
		vsp = 0
		
		attackMakeHeavyInvincible = true
		
		buzzcutShootTimerMax = 20
		buzzcutShootTimer = 0
	}
	#endregion
	
	if (!localPause)
	{	
		
		buzzcutShootTimer = max(buzzcutShootTimer - speedMultFinal,0)
		
		if (buzzcutShootTimer == 0)
		{
			instance_create_depth(x,y,depth-1,obj_MKSS_Cutscene_Nimbia_BuzzcutChainling)
			buzzcutShootTimer = buzzcutShootTimerMax
		}
		
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