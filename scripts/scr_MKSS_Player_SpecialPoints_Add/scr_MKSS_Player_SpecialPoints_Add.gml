///@description MKSS - Player - Special Points - Add

function scr_MKSS_Player_SpecialPoints_Add(targetSpecialPoints)
{
	if (global.MKSS_SpecialCurrent != global.MKSS_SpecialTarget)
	{
		global.MKSS_SpecialCurrent = min(global.MKSS_SpecialCurrent + targetSpecialPoints,global.MKSS_SpecialTarget);
		
		if ((global.MKSS_SpecialCurrent == global.MKSS_SpecialTarget) and (!global.MKSS_SpecialDeflation))
		{
			scr_PlaySfx(snd_MKSS_SpecialBarCharge);
			
			with (obj_FrameworkControl)
			{
				hud_SpecialBarFlashTimer = hud_SpecialBarFlashTimerMax;
			}
			
			scr_MKSS_ObtainNotif(global.MKSS_NotifIDs[? "specialBarTutorial"]);
			
			//STRIMPTODO Effects
		}
	}
}