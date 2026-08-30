///@description MKSS - Player - Meta Knight - State - Starless Marx Laser Parry - Step

function scr_MKSS_Player_MetaKnight_State_StarlessMarxLaserParry_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		hsp = 0;
		vsp = 0;
		
		parryState = 0;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Parry Laser
		var _revert = false;
		
		switch (parryState)
		{
			case 0:
			
			break;
		}
		
		if (_revert)
		{
			hsp = 0;
			vsp = 0;
			
			scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
		}
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprParry;
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}