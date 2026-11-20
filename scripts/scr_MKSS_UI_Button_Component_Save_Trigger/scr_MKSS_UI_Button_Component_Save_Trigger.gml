///@description MKSS - UI - Button - Component - Save - Trigger

function scr_MKSS_UI_Button_Component_Save_Trigger(targetNum,targetSave)
{
	if ((isSelected) and (!input_check("start",playerNum)) and (scr_MouseIsInbetween(x - 20,y,x,y + 35)))
	{
		#region Delete Save
		if ((obj_MKSS_Menu_TitleScreen.saveExists[targetNum]) and (!instance_exists(obj_MKSS_UI_NotifBox)))
		{
			obj_MKSS_Menu_TitleScreen.currentSelectedSave = targetSave;
			
			scr_MKSS_ObtainNotif(global.MKSS_NotifIDs[? "deleteSave1"],true);
		}
		#endregion
	}
	else
	{
		#region Go To Game
		if (!instance_exists(obj_Transition))
		{
			var sfx = scr_PlaySfx(snd_MKSS_DoorEnter);
			//audio_sound_pitch(sfx,random_range(.85,1.15));
			scr_Music_SetFade(0);
		
			global.selectedSave = targetSave;
			global.lastSelectedSave = global.selectedSave;
		
			scr_MKSS_SaveGeneral("general.ini");
			scr_MKSS_LoadCrossovers(global.selectedSave);
			scr_MKSS_LoadData(global.selectedSave);
			scr_MKSS_Player_SetWeapons(playerNum);
			scr_MKSS_Player_GetUnlockedUpgrades(playerNum);
		
			var targetRoom = rm_MKSS_BattleshipHalberd;
			var targetAlphaSpd = .05;
			var	targetRoomSpawnX = global.MKSS_LastPedestalSpawnX;
			var	targetRoomSpawnY = global.MKSS_LastPedestalSpawnY;
			if (global.debug)
			{
				targetRoom = rm_MKSS_Debug_Lobby;
				var	targetRoomSpawnX = -1;
				var	targetRoomSpawnY = -1;
			}
			else if (!global.MKSS_StageList[global.MKSS_StageIDs[? "starryShores"]].isBeaten)
			{
				if (global.MKSS_StageList[global.MKSS_StageIDs[? "iceCreamIsland"]].isBeaten)
				{
					targetRoom = rm_MKSS_StarryShores_1;
					var	targetRoomSpawnX = -1;
					var	targetRoomSpawnY = -1;
				}
				else
				{
					targetRoom = rm_MKSS_IceCreamIsland_1;
					var targetAlphaSpd = .01;
					var	targetRoomSpawnX = -1;
					var	targetRoomSpawnY = -1;
				}
			}
		
			with (scr_GoToRoom_PlayerPosition(targetRoom,true,targetRoomSpawnX,targetRoomSpawnY))
			{
				alphaSpd = targetAlphaSpd;
			}
		}
		#endregion
	}
}