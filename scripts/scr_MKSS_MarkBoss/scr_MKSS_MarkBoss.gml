///@description MKSS - Mark Boss

function scr_MKSS_MarkBoss(targetBoss)
{
	global.MKSS_MarkedBossID = targetBoss;
	global.MKSS_MarkedBossTitle = global.MKSS_EnemyList[targetBoss.enemyID].name;
	global.MKSS_MarkedBossHealthbarScript = global.MKSS_EnemyList[targetBoss.enemyID].enemyHealthbarScript;
}