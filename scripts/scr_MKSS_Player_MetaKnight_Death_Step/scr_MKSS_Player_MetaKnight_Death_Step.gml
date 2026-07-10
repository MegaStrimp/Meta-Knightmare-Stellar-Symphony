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
		spriteTurnTimerMax = 5;
		
		with (obj_Particle) if (owner == other) instance_destroy();
		
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
				scr_ChangeSprite(spriteSet.sprDeath);
				scr_MKSS_ParticleSet_Death(x,y);
				
				vsp = -jumpspeedDeath * speedMultFinal;
				
				scr_PlayMusic(global.MKSS_MusicList[global.MKSS_MusicIDs[? "death"]].audio,false);
				
				spriteTurnTimer = spriteTurnTimerMax;
				deathStateTimer = 180;
				break;
				
				case 2:
				with (instance_create_depth(0,0,0,obj_MKSS_UI_Death))
				{
					playerNum = other.playerNum;
				}
				
				deathStateTimer = -1;
				break;
			}
		}
	}
	#endregion
	
	#region Sprite Turn Timer
	if (spriteTurnTimer != -1)
	{
		spriteTurnTimer = max(spriteTurnTimer - speedMultFinal,0);
		if (spriteTurnTimer == 0)
		{
			image_index = (image_index + 1) % image_number;
			
			var par = scr_MKSS_ParticleSet_FallDuck(x,y,1,irandom_range(0,359));
			par[0].particleAfterDeath[0] = scr_MKSS_ParticleSet_SmallSparkle_NoPause;
			par[0].canBePaused = false;
			
			spriteTurnTimer = spriteTurnTimerMax;
		}
	}
	#endregion
	
	#region Position
	scr_Component_SetPosition(hsp,vsp);
	#endregion
}