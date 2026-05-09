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
				scr_PlaySfx(snd_MKSS_BossHealth);
				
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
}

#region Debug
if (global.debug)
{
	#region Stage Clear Test
	if (keyboard_check_pressed(vk_space))
	{
		if (keyboard_check(vk_shift))
		{
			scr_MKSS_Player_GetStunned(obj_Player);
		}
		else
		{
			scr_MKSS_Stage_Clear();
		}
	}
	#endregion
	
	#region Debug Lobby
	if (keyboard_check_pressed(ord("L")))
	{
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
}
#endregion