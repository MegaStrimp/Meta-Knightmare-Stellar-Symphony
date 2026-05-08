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
				swordShineTimer = 10;
				stateTimer = 60;
				break;
				
				case 2:
				stateTimer = 75;
				break;
				
				case 3:
				stateTimer = -1;
				break;
			}
		}
	}
	#endregion
	
	#region Overlay
	blackAlpha = max(0,blackAlpha - .02);
	swordMaskAlpha = max(0,swordMaskAlpha - .02);
	#endregion
	
	#region Sword
	if (state >= 1)
	{
		swordShineX = min(swordShineX + 5,300);
	}
	
	if (state >= 4)
	{
		swordAngle = min(swordAngle + 5,90);
		swordX = lerp(swordX,2,.3);
		swordY = lerp(swordY,160,.2);
	}
	else
	{
		swordX = min(swordX + 30,40);
	}
	#endregion
	
	#region Sword Shine Timer
	if (swordShineTimer != -1)
	{
		swordShineTimer = max(swordShineTimer - speedMultFinal,0);
		if (swordShineTimer == 0)
		{
			swordShineX = -50;
			swordShineTimer = 420;
		}
	}
	#endregion
	
	#region Subtitle
	if (state >= 2)
	{
		subtitleFrame = min(subtitleFrame + subtitleImageSpeed,17);
	}
	#endregion
	
	#region Stars
	if (state >= 3)
	{
		starAlpha = min(starAlpha + .01,1);
	}
	#endregion
	
	if (state >= 4)
	{
		#region Save Buttons
		saveButtonX = lerp(saveButtonX,263,.1);
		
		miscButtonY = lerp(miscButtonY,128,.1);
		#endregion
		
		#region Title Sword Stars Timer
		if (titleSwordStarsTimer != -1)
		{
			titleSwordStarsTimer = max(titleSwordStarsTimer - speedMultFinal,0);
			if (titleSwordStarsTimer == 0)
			{
				var starPar = instance_create_depth(0,176,depth,obj_MKSS_Menu_TitleScreen_TitleSwordStars);
				starPar.anchorDepth = depth;
				starPar.image_index = irandom_range(0,6);
				starPar.image_speed = 0;
				
				titleSwordStarsTimer = irandom_range(15,30);
			}
		}
		#endregion
	}
	
	if (canSelect)
	{
		#region Selection
		if (state == 3)
		{
			if (input_check_pressed("start",playerNum))
			{
				scr_PlaySfx(snd_MKSS_ButtonYes);
				
				state = 4;
				
				#region Create Buttons
				var mappedButtonID_Save1 = global.MKSS_ButtonIDs[? "save1"];
				scr_UI_Button_CreateFromList(mappedButtonID_Save1,saveButtonX,4,depth,global.MKSS_ButtonList[mappedButtonID_Save1]);
				
				var mappedButtonID_Save2 = global.MKSS_ButtonIDs[? "save2"];
				scr_UI_Button_CreateFromList(mappedButtonID_Save2,saveButtonX,44,depth,global.MKSS_ButtonList[mappedButtonID_Save2]);
				
				var mappedButtonID_Save3 = global.MKSS_ButtonIDs[? "save3"];
				scr_UI_Button_CreateFromList(mappedButtonID_Save3,saveButtonX,84,depth,global.MKSS_ButtonList[mappedButtonID_Save3]);
				
				var mappedButtonID = global.MKSS_ButtonIDs[? "discord"];
				scr_UI_Button_CreateFromList(mappedButtonID,77,miscButtonY,depth,global.MKSS_ButtonList[mappedButtonID]);
				
				var mappedButtonID = global.MKSS_ButtonIDs[? "twitter"];
				scr_UI_Button_CreateFromList(mappedButtonID,119,miscButtonY,depth,global.MKSS_ButtonList[mappedButtonID]);
				
				var mappedButtonID = global.MKSS_ButtonIDs[? "github"];
				scr_UI_Button_CreateFromList(mappedButtonID,161,miscButtonY,depth,global.MKSS_ButtonList[mappedButtonID]);
				
				var mappedButtonID = global.MKSS_ButtonIDs[? "exit"];
				scr_UI_Button_CreateFromList(mappedButtonID,203,miscButtonY,depth,global.MKSS_ButtonList[mappedButtonID]);
				
				var targetButtonID = mappedButtonID_Save1;
				switch (global.lastSelectedSave)
				{
					case "Save2.ini":
					targetButtonID = mappedButtonID_Save2;
					break;
					
					case "Save3.ini":
					targetButtonID = mappedButtonID_Save3;
					break;
				}
				
				scr_UI_Button_Select(targetButtonID);
				#endregion
			}
		}
	}
}