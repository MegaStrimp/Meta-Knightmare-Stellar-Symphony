///@description Main

if (isActive)
{
	#region Selection
	if (paletteListCount > 1)
	{
		if (input_check_pressed("left",playerNum))
		{
			scr_PlaySfx(snd_MKSS_Select);
			
			selection = (selection - 1 + paletteListCount) % paletteListCount;
			
			var currentID = ds_list_find_value(paletteList,selection);
			currentName = global.MKSS_SprayPaintList[currentID].name;
			currentSprite = global.MKSS_SprayPaintList[currentID].sprite;
			
			with (obj_Player) if (playerNum == other.playerNum) scr_MKSS_Player_EquipSpray(currentID);
			
			paintRollerSprite = spr_MKSS_PaintChanger_PaintRoller_Paint;
			paintRollerCanSprite = spr_MKSS_PaintChanger_PaintRoller_Paint_Can;
			paintRollerIndex = 0;
			paintRollerOffsetTarget = 32;
			
			paintRollerTimer = paintRollerTimerMax;
			dustTimer = dustTimerMax;
			
			scratchX = x;
			scratchY = y;
			with (obj_Player)
			{
				if (playerNum == other.playerNum)
				{
					other.scratchX = x;
					other.scratchY = y;
				}
			}
			
			scratchTimer = scratchTimerMax;
			
			sprayCanBounceTimer = sprayCanBounceTimerMax;
		}
		
		if (input_check_pressed("right",playerNum))
		{
			scr_PlaySfx(snd_MKSS_Select);
			
			selection = (selection + 1 + paletteListCount) % paletteListCount;
			
			var currentID = ds_list_find_value(paletteList,selection);
			currentName = global.MKSS_SprayPaintList[currentID].name;
			currentSprite = global.MKSS_SprayPaintList[currentID].sprite;
			
			with (obj_Player) if (playerNum == other.playerNum) scr_MKSS_Player_EquipSpray(currentID);
			
			paintRollerSprite = spr_MKSS_PaintChanger_PaintRoller_Paint;
			paintRollerCanSprite = spr_MKSS_PaintChanger_PaintRoller_Paint_Can;
			paintRollerIndex = 0;
			paintRollerOffsetTarget = 32;
			
			paintRollerTimer = paintRollerTimerMax;
			dustTimer = dustTimerMax;
			
			scratchX = x;
			scratchY = y;
			with (obj_Player)
			{
				if (playerNum == other.playerNum)
				{
					other.scratchX = x;
					other.scratchY = y;
				}
			}
			
			scratchTimer = scratchTimerMax;
			
			sprayCanBounceTimer = sprayCanBounceTimerMax;
		}
	}
	
	if (input_check_pressed("B",playerNum))
	{
		scr_PlaySfx(snd_MKSS_ButtonNo);
		
		with (ownerPedestal) isActive = false;
		with (obj_Player)
		{
			if (playerNum == other.playerNum)
			{
				isPaused = false;
			}
		}
		
		isActive = false;
	}
	#endregion
}

if (!localPause)
{
	#region Paint Roller
	paintRollerIndex = (paintRollerIndex + paintRollerSpeed) % paintRollerNumber;
	paintRollerOffset = lerp(paintRollerOffset,paintRollerOffsetTarget,.1);
	#endregion
	
	#region Paint Roller Timer
	if (paintRollerTimer != -1)
	{
		paintRollerTimer = max(paintRollerTimer - speedMultFinal,0);
		if (paintRollerTimer == 0)
		{
			paintRollerSprite = spr_MKSS_PaintChanger_PaintRoller_Idle;
			paintRollerCanSprite = spr_MKSS_PaintChanger_PaintRoller_Idle_Can;
			paintRollerIndex = 0;
			paintRollerOffsetTarget = 0;
			dustTimer = -1;
			
			paintRollerTimer = -1;
		}
	}
	#endregion
}

#region Scratch
scratchIndex = (scratchIndex + scratchSpeed) % scratchNumber;
#endregion

#region Scratch Timer
if (scratchTimer != -1)
{
	scratchTimer = max(scratchTimer - speedMultFinal,0);
	if (scratchTimer == 0)
	{
		scratchTimer = -1;
	}
}
#endregion

#region Dust Timer
if (dustTimer != -1)
{
	dustTimer = max(dustTimer - speedMultFinal,0);
	if (dustTimer == 0)
	{
		scr_MKSS_ParticleSet_Dust(x - 20 + 72 - paintRollerOffset,y + 16 - 18,layer_get_depth("Player") - 1,currentSprite);
		
		dustTimer = dustTimerMax;
	}
}
#endregion

#region Spray Can Bounce Timer
if (sprayCanBounceTimer != -1)
{
	sprayCanBounceTimer = max(sprayCanBounceTimer - speedMultFinal,0);
	if (sprayCanBounceTimer == 0)
	{
		sprayCanBounceTimer = -1;
	}
}
#endregion

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion