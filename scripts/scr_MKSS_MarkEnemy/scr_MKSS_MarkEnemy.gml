///@description MKSS - Mark Enemy

function scr_MKSS_MarkEnemy(targetEnemy)
{
	global.MKSS_MarkedEnemyID = targetEnemy;
	global.MKSS_MarkedEnemyTitle = global.MKSS_EnemyList[targetEnemy.enemyID].name;
	global.MKSS_MarkedEnemyHealthbarScript = global.MKSS_EnemyList[targetEnemy.enemyID].enemyHealthbarScript;
	global.MKSS_MarkedEnemyTimer = global.MKSS_MarkedEnemyTimerMax;
	
	if ((global.MKSS_MarkedBossID != -1) and (instance_exists(global.MKSS_MarkedBossID)))
	{
		with (global.MKSS_MarkedBossID)
		{
			healthbarFill = false;
			hpHealthbar = hp;
			hpHealthbarMiddle = hp;
		}
	}
}