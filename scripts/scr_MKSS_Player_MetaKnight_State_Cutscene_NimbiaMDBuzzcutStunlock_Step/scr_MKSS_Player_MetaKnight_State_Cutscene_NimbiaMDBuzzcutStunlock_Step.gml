function scr_MKSS_Player_MetaKnight_State_Cutscene_NimbiaMDBuzzcutStunlock_Step(){
	#region Setup
	if (playerState_Setup)
	{	
		playerState_Setup = false;
		
		dirX = 1
		
		hsp = -0.5
		vsp = -1
	}
	#endregion
	
	if (y >= obj_MKSS_Enemy_Nimbia.y - 20)
	{
		hsp = 0
		vsp = 0
	}
	
	#region Animation
	if (!hasAttackAnimation)
	{
		sprite_index = spriteSet.sprAttackBuzzcutSlash1;
		image_index = 0
	}
	#endregion
	
	
	scr_MKSS_Player_Component_Movement()
	scr_MKSS_Player_Component_Gravity()
		
	#region Collision
	scr_Entity_Collision();
	#endregion
}