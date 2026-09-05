///@description MKSS - Player - Meta Knight - Cutscene - Ice Cream Island End - Step

function scr_MKSS_Player_MetaKnight_State_Cutscene_IceCreamIslandEnd_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		fallen = false;
		
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
			if (!isWalking)
			{
				if (fallen)
				{
					sprite_index = spriteSet.sprFallen;
				}
				else
				{
					sprite_index = spriteSet.sprIdle;
				}
			}
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