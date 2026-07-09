///@description MKSS - Player - Special Points - Add

function scr_MKSS_Player_SpecialPoints_Add(targetSpecialPoints)
{
	if (global.MKSS_SpecialCurrent != global.MKSS_SpecialTarget)
	{
		global.MKSS_SpecialCurrent += targetSpecialPoints;
		
		if (global.MKSS_SpecialCurrent >= global.MKSS_SpecialTarget)
		{
			//STRIMPTODO Effects
			
			global.MKSS_SpecialCurrent = global.MKSS_SpecialTarget;
		}
	}
}