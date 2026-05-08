///@description Main

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
		with (obj_Player) scr_Player_GetHit(id,1);
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