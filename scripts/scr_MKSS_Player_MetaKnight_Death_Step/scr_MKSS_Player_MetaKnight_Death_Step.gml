///@description MKSS - Player - Meta Knight - State - Death - Step

function scr_MKSS_Player_MetaKnight_Death_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		hsp = 0;
		vsp = 0;
		
		imageSpeed = 0;
		clampToView = false;
		clampToRoom = false;
		
		deathState = 0;
		deathStateTimer = 80;
		spriteTurnTimer = -1;
		spriteTurnTimerMax = 10;
		
		playerState_Setup = false;
	}
	#endregion
	
	#region Gravity
	if (deathState != 0) vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
	#endregion
	
	#region Death State Timer
	if (deathStateTimer != -1)
	{
		deathStateTimer = max(deathStateTimer - speedMultFinal,0);
		if (deathStateTimer == 0)
		{
			deathState += 1;
			
			switch (deathState)
			{
				case 1:
				//scr_ChangeSprite(spriteSet.sprDeath);
				//scr_DL1_ParticleSet_Miss(x,y);
				
				vsp = -jumpspeedNormal * speedMultFinal;
				
				//scr_PlayMusic(global.DL1_MusicList[global.DL1_MusicIDs[? "miss"]].audio);
				
				spriteTurnTimer = spriteTurnTimerMax;
				deathStateTimer = 180;
				break;
				
				case 2:
				with (instance_create_depth(0,0,0,obj_MKSS_UI_Death))
				{
					global.hasHud = false;
					
					playerNum = other.playerNum;
				}
				
				deathStateTimer = -1;
				break;
			}
		}
	}
	#endregion
	
	#region Death State Timer
	if (spriteTurnTimer != -1)
	{
		spriteTurnTimer = max(spriteTurnTimer - speedMultFinal,0);
		if (spriteTurnTimer == 0)
		{
			image_index += 1;
			//var par = scr_DL1_ParticleSet_FallDuck(x,y,1,irandom_range(0,359));
			//par[0].canBePaused = false;
			
			spriteTurnTimer = spriteTurnTimerMax;
		}
	}
	#endregion
	
	#region Position
	scr_Component_SetPosition(hsp,vsp);
	#endregion
}