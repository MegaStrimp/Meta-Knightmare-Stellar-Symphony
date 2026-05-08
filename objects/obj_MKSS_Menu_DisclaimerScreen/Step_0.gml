///@description Main

#region Variables
var canSelect = true;
if (
(instance_exists(obj_Transition))
) canSelect = false;
#endregion

if (!global.pauseFinal)
{
	#region State Timer
	if (stateTimer != -1)
	{
		stateTimer = max(stateTimer - speedMultFinal,0);
		if (stateTimer == 0)
		{
			state += 1;
			switch (state)
			{
				case 1:
				stateTimer = 30;
				break;
				
				case 2:
				stateTimer = -1;
				break;
				
				case 3:
				scr_PlaySfx(snd_MKSS_IntroSlash);
				strimpState = 1;
				stateTimer = 30;
				break;
				
				case 4:
				strimpState = 2;
				stateTimer = 90;
				break;
				
				case 5:
				if (canSelect) room_goto(rm_MKSS_Menu_TitleScreen);
				stateTimer = -1;
				break;
			}
		}
	}
	#endregion
	
	#region Overlay
	if (state >= 1)
	{
		disclaimerAlpha = max(0,disclaimerAlpha - .08);
	}
	#endregion
	
	#region Strimp Animation
	if (strimpState != 2)
	{
		strimpSprite = spr_MKSS_Menu_TitleScreen_Strimp;
		if (strimpState == 1)
		{
			strimpSprite = spr_MKSS_Menu_TitleScreen_StrimpDead;
		}
		
		strimpFrame = (strimpFrame + (sprite_get_speed(strimpSprite) / 60) + sprite_get_number(strimpSprite)) % sprite_get_number(strimpSprite);
	}
	
	if (state >= 3)
	{
		strimpX += 20;
		strimpY -= 5;
	}
	#endregion
	
	#region Sword
	if ((state == 2) and (swordX == 40)) stateTimer = 0;
	
	if (state >= 2)
	{
		swordX = min(swordX + 30,40);
	}
	#endregion
	
	if (canSelect)
	{
		#region Selection
		if (input_check_pressed("start",playerNum))
		{
			global.MKSS_DisclaimerScreen_Skipped = true;
			
			scr_GoToRoom(rm_MKSS_Menu_TitleScreen,false);
		}
		#endregion
	}
}