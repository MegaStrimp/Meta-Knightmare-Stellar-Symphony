///@description MKSS - Set Enemies

function scr_MKSS_SetEnemies()
{
	#region Setup
	global.MKSS_EnemyList = [];
	global.MKSS_EnemyIDs = ds_map_create();
	#endregion
	
	#region Enemies
	scr_MKSS_AddEnemy("waddleDee","Waddle Dee");
	scr_MKSS_AddEnemy("brontoBurt","Bronto Burt");
	scr_MKSS_AddEnemy("ghostKnight","Ghost Knight");
	scr_MKSS_AddEnemy("gordo","Gordo");
	scr_MKSS_AddEnemy("peezer","Peezer");
	scr_MKSS_AddEnemy("mrSandbag","Mr. Sandbag");
	#endregion
}