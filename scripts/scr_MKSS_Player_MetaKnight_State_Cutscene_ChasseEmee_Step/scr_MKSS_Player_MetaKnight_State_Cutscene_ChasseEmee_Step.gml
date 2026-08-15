///@description MKSS - Player - Meta Knight - Cutscene - Chasse-Emee - Step

function scr_MKSS_Player_MetaKnight_State_Cutscene_ChasseEmee_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Movement
		scr_MKSS_Player_Component_Movement();
		#endregion
		
		#region Animation
		
		if ((hsp == 0) and (runTurnBuffer == -1))
		{
			if (!isWalking) sprite_index = spriteSet.sprIdle;
		}
		else
		{
			sprite_index = spriteSet.sprWalk;
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}