///@description Player - Meta Knight - State - Stage Clear - Step

function scr_MKSS_Player_MetaKnight_State_StageClear_Step()
{
	#region Setup
	if (playerState_Setup)
	{
		attackMakeHeavyInvincible = true;
		dirX = 1;
		hurtTimer = 0;
		clampToRoom = false;
		clampToView = false;
		
		stageClear_State = 0
		stageClear_StateTimer = 20;
		stageClear_XOffset = 0;
		stageClear_YOffset = 0;
		
		scr_ChangeSprite(spriteSet.sprFloat);
		
		playerState_Setup = false;
	}
	#endregion
	
	#region Variables
	localPause = false;
	#endregion
	
	#region Movement
	if (stageClear_State >= 3)
	{
		stageClear_XOffset += (6 * speedMultFinal);
		stageClear_YOffset -= (10 * speedMultFinal);
	}
	#endregion
	
	#region Stage Clear - State Timer
	if (stageClear_StateTimer != -1)
	{
		stageClear_StateTimer = max(stageClear_StateTimer - speedMultFinal,0);
		if (stageClear_StateTimer == 0)
		{
			stageClear_State += 1;
			
			switch (stageClear_State)
			{
				case 1:
				stageClear_XOffset = 16;
				stageClear_YOffset = 40;
				
				stageClear_StateTimer = -1;
				break;
				
				case 2:
				stageClear_XOffset = 48;
				stageClear_YOffset = 56;
				
				stageClear_StateTimer = 5;
				break;
				
				case 3:
				scr_PlaySfx(snd_MKSS_WingFlap);
				
				scr_ChangeSprite(spriteSet.sprFlap);
				
				stageClear_StateTimer = -1;
				break;
			}
		}
	}
	#endregion
	
	#region Animation
	sprite_index = spriteSet.sprFloat;
	#endregion
	
	#region Position
	var xx = camera_get_view_x(mainView);
	var yy = camera_get_view_y(mainView);
	
	var waveOffset = sine_wave(current_time / 1500,1,4,0) * speedMultFinal;
	
	x = lerp(x,xx + (global.gameWidth / 2) + stageClear_XOffset,.1);
	y = lerp(y,yy + (global.gameHeight / 2) + waveOffset + stageClear_YOffset,.05);
	#endregion
}