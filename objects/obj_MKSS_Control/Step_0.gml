///@description Main

for (var i = 0; i < global.maxPlayers; i++)
{
	#region Heal Pause Timer
	var healthAccel = 4;
	
	if (healPauseTimer[i] != -1)
	{
		healPauseTimer[i] = max(healPauseTimer[i] - speedMultFinal,0);
		if (healPauseTimer[i] == 0)
		{
			if ((healPauseTargetHeal[i] > 0) and (global.playerHp[i] < global.playerMaxHp[i]) and (healPauseTargetHeal[i] >= healthAccel))
			{
				var sfx = scr_PlaySfx(snd_MKSS_BossHealth);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				global.playerHp[i] = min(global.playerMaxHp[i],global.playerHp[i] + healthAccel);
				healPauseTargetHeal[i] -= healthAccel;
				
				healPauseTimer[i] = 2;
			}
			else
			{
				global.playerHp[i] = min(global.playerMaxHp[i],global.playerHp[i] + healPauseTargetHeal[i]);
				healPauseTargetHeal[i] = 0;
				
				healPauseTimer[i] = -1;
			}
		}
	}
	#endregion
	
	if (!global.pauseFinal)
	{
		#region Special Deflation
		if (global.MKSS_SpecialDeflation)
		{
			if (specialDeflationTimer != -1)
			{
				specialDeflationTimer = max(specialDeflationTimer - speedMultFinal,0);
				if (specialDeflationTimer == 0)
				{
					global.MKSS_SpecialCurrent -= 1;
					
					specialDeflationTimer = -1;
				}
			}
			else
			{
				specialDeflationTimer = specialDeflationTimerMax;
			}
			
			if (global.MKSS_SpecialCurrent <= 0)
			{
				global.MKSS_SpecialCurrent = 0;
				global.MKSS_SpecialDeflation = false;
			}
		}
		#endregion
		
		#region Player Meta Quick Timer
		if ((!global.MKSS_CutsceneStopMovement) and (!global.MKSS_SpecialDeflation))
		{
			if (playerMetaQuickTimer[i] != -1)
			{
				playerMetaQuickTimer[i] = max(playerMetaQuickTimer[i] - speedMultFinal,0);
				if (playerMetaQuickTimer[i] == 0)
				{
					playerMetaQuickTimer[i] = -1;
				}
			}
		}
		#endregion
	}
}

#region Debug
if (global.debug)
{
	#region Stage Clear Test
	if (!global.pauseFinal)
	{
		if (keyboard_check_pressed(vk_space))
		{
			if (keyboard_check(vk_shift))
			{
				scr_MKSS_Stage_Clear();
			}
		}
	}
	#endregion
	
	#region Debug Lobby
	if (keyboard_check_pressed(ord("L")))
	{
		scr_MKSS_LoadData(global.selectedSave);
		
		scr_MKSS_Stage_End();
		
		room_goto(rm_MKSS_Debug_Lobby);
	}
	#endregion
	
	#region Hurt Player
	if (keyboard_check_pressed(ord("K")))
	{
		with (obj_Player) scr_Player_GetHit(id,50);
	}
	#endregion
	
	#region Get Gold Medal
	if ((keyboard_check(vk_shift)) and (keyboard_check_pressed(ord("O"))))
	{
		scr_MKSS_Hud_Medal_Get(2);
	}
	#endregion
	
	#region Toggle Hud
	if (keyboard_check_pressed(vk_f1)) global.hasHud = !global.hasHud;
	#endregion
}
else if (global.demo)
{
	#region Beta Lobby
	if (keyboard_check_pressed(ord("L")))
	{
		scr_MKSS_LoadData(global.selectedSave);
		
		scr_MKSS_Stage_End();
		
		room_goto(rm_MKSS_Debug_Lobby_Beta);
	}
	#endregion
}
#endregion