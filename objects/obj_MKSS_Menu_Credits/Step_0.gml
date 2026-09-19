///@description Main

#region Variables
var canSelect = true;
if (
(global.pauseFinal) or
(instance_exists(obj_Transition))
) canSelect = false;
#endregion

#region Scroll Timer
if (scrollTimer != -1)
{
	scrollTimer = max(scrollTimer - speedMultFinal,0);
	if (scrollTimer == 0)
	{
		yScroll -= speedMultFinal;
	
		scrollTimer = scrollTimerMax;
	}
}
#endregion

#region Selection
if (canSelect)
{
	if ((input_check_pressed("B",playerNum)) or (keyboard_check_pressed(vk_escape)) or ((scr_MouseIsInbetween(4,144,43,156)) and (mouse_check_button_pressed(mb_left))))
	{
		scr_PlaySfx(snd_KSW_ButtonNo);
		
		scr_GoToRoom(rm_KSW_Menu_TitleScreen,true);
	}
	
	#region Exit Timer
	if (exitTimer != -1)
	{
		exitTimer = max(exitTimer - speedMultFinal,0);
		if (exitTimer == 0)
		{
			scr_GoToRoom(rm_KSW_Menu_TitleScreen,true);
		
			exitTimer = -1;
		}
	}
	#endregion
}
#endregion

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion