///@description MKSS - Player - Meta Knight - State - Starless Marx Black Hole - Step

function scr_MKSS_Player_MetaKnight_State_StarlessMarxBlackHole_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		hsp = 0;
		vsp = 0;
		
		suckState = 0;
		
		playerState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Suck Suck
		var _revert = false;
		var _blackHole = -1;
		if (instance_exists(obj_MKSS_Enemy_StarlessMarx))
		{
			if (blackHole != -1)
			{
				if (instance_exists(blackHole))
				{
					_blackHole = blackHole;
				}
			}
		}
		
		switch (suckState)
		{
			case 0:
			if (_blackHole)
			{
				var _dir = -1;
				if (y < _blackHole.y) _dir = 1;
				var _suckSpeed = 2.2;
				
				vsp = _suckSpeed * _dir;
				
				if (instance_place(x,y,_blackHole))
				{
					hsp = 0;
					vsp = 0;
					
					image_alpha = 0;
					
					suckState++;
				}
			}
			
			if (_blackHole == -1) _revert = true;
			break;
			
			case 1:
			if (_blackHole == -1) 
			{
				image_alpha = 1;
				
				_revert = true;
			}
			
			case 2:
			if (_blackHole == -1) 
			{
				vsp = 8;
				
				if (y >= room_height/2) and (instance_place(x,y,obj_Wall))
				{
					
				}
			}
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
		sprite_index = spriteSet.sprDeath;
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}