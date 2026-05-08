///@description Begin Step

#region Flags
global.flag_MKSS_MetaPointCollect = false;
global.flag_MKSS_AbilitySwitch = false;
#endregion

#region Marked Enemy
if ((global.MKSS_MarkedEnemyID != -1) and (!instance_exists(global.MKSS_MarkedEnemyID)))
{
	global.MKSS_MarkedEnemyID = -1;
	global.MKSS_MarkedEnemyTitle = -1;
}

if (!global.pauseFinal)
{
	if ((global.MKSS_MarkedEnemyTimer != -1) and (global.MKSS_MarkedEnemyID != -1))
	{
		global.MKSS_MarkedEnemyTimer = max(global.MKSS_MarkedEnemyTimer - global.speedMultGlobal,0);
		if (global.MKSS_MarkedEnemyTimer == 0)
		{
			global.MKSS_MarkedEnemyID = -1;
			global.MKSS_MarkedEnemyTitle = -1;
			
			global.MKSS_MarkedEnemyTimer = -1;
		}
	}
}
#endregion

#region Marked Boss
if ((global.MKSS_MarkedBossID != -1) and (!instance_exists(global.MKSS_MarkedBossID)))
{
	global.MKSS_MarkedBossID = -1;
	global.MKSS_MarkedBossTitle = -1;
}
#endregion