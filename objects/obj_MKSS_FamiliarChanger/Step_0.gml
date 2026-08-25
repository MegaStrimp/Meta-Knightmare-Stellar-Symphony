///@description Main

if (isActive)
{
	#region Selection
	if (familiarListCount > 1)
	{
		if (input_check_pressed("left",playerNum))
		{
			var sfx = scr_PlaySfx(snd_MKSS_Select);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			selection = (selection - 1 + familiarListCount) % familiarListCount;
			
			var currentID = ds_list_find_value(familiarList,selection);
			currentName = global.MKSS_FamiliarList[currentID].name;
			currentSprite = global.MKSS_FamiliarList[currentID].sprite;
			
			with (obj_Player) if (playerNum == other.playerNum) scr_MKSS_Player_EquipFamiliar(currentID);
			
			familiarBounceTimer = familiarBounceTimerMax;
		}
		
		if (input_check_pressed("right",playerNum))
		{
			var sfx = scr_PlaySfx(snd_MKSS_Select);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			selection = (selection + 1 + familiarListCount) % familiarListCount;
			
			var currentID = ds_list_find_value(familiarList,selection);
			currentName = global.MKSS_FamiliarList[currentID].name;
			currentSprite = global.MKSS_FamiliarList[currentID].sprite;
			
			with (obj_Player) if (playerNum == other.playerNum) scr_MKSS_Player_EquipFamiliar(currentID);
			
			familiarBounceTimer = familiarBounceTimerMax;
		}
	}
	
	if (input_check_pressed("B",playerNum))
	{
		var sfx = scr_PlaySfx(snd_MKSS_ButtonNo);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		global.hasHud = true;
		
		scr_MKSS_SaveData(global.selectedSave);
		
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
	
	if (canTeleport)
	{
		if (input_check_pressed("L",playerNum))
		{
			var sfx = scr_PlaySfx(snd_MKSS_ButtonChange);
			audio_sound_pitch(sfx,random_range(.85,1.15));
		
			var pedestalList = obj_MKSS_Pedestal_Controller.pedestalList;
			var pedestalListSize = ds_list_size(pedestalList);
			var targetPedestal = ds_list_find_value(pedestalList,(ds_list_find_index(pedestalList,ownerPedestal) + 1 + pedestalListSize) % pedestalListSize);
		
			global.hasHud = true;
		
			with (ownerPedestal) isActive = false;
			with (obj_Player)
			{
				if (playerNum == other.playerNum)
				{
					x = targetPedestal.x;
					y = targetPedestal.y - 16;
				}
			}
			with (obj_MKSS_Familiar)
			{
				x = followedObject.x - (24 * followedObject.dirX);
				y = followedObject.y - 24;
			}
			with (targetPedestal)
			{
				targetPlayer = other.ownerPedestal.targetPlayer;
				if (activationScript != -1) script_execute(activationScript);
			}
		
			isActive = false;
		}
	
		if (input_check_pressed("R",playerNum))
		{
			var sfx = scr_PlaySfx(snd_MKSS_ButtonChange);
			audio_sound_pitch(sfx,random_range(.85,1.15));
		
			var pedestalList = obj_MKSS_Pedestal_Controller.pedestalList;
			var pedestalListSize = ds_list_size(pedestalList);
			var targetPedestal = ds_list_find_value(pedestalList,(ds_list_find_index(pedestalList,ownerPedestal) - 1 + pedestalListSize) % pedestalListSize);
		
			global.hasHud = true;
		
			with (ownerPedestal) isActive = false;
			with (obj_Player)
			{
				if (playerNum == other.playerNum)
				{
					x = targetPedestal.x;
					y = targetPedestal.y - 16;
				}
			}
			with (obj_MKSS_Familiar)
			{
				x = followedObject.x - (24 * followedObject.dirX);
				y = followedObject.y - 24;
			}
			with (targetPedestal)
			{
				targetPlayer = other.ownerPedestal.targetPlayer;
				if (activationScript != -1) script_execute(activationScript);
			}
		
			isActive = false;
		}
	}
	#endregion
}

#region Familiar Bounce Timer
if (familiarBounceTimer != -1)
{
	familiarBounceTimer = max(familiarBounceTimer - speedMultFinal,0);
	if (familiarBounceTimer == 0)
	{
		familiarBounceTimer = -1;
	}
}
#endregion

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion