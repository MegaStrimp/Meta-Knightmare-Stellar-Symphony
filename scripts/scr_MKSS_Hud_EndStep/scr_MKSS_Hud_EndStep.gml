///@description MKSS - Hud - End Step

function scr_MKSS_Hud_EndStep()
{
	#region Meta Point Collect Timer
	if (global.flag_MKSS_MetaPointCollect) metaPointCollectTimer = metaPointCollectTimerMax;
	
	if (metaPointCollectTimer != -1)
	{
		metaPointCollectTimer = max(metaPointCollectTimer - speedMultFinal,0);
		if (metaPointCollectTimer == 0)
		{
			metaPointCollectTimer = -1;
		}
	}
	#endregion
}