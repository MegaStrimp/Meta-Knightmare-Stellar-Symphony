///@description MKSS - Enemy Arena - Add

function scr_MKSS_EnemyArena_Add(targetEnemyX,targetEnemyY,targetEnemyObject,targetEnemyAISetup,targetEnemyAISetupArg = [],targetNextTimer = 0,targetSpawnTimer = 60,targetDirX = 1,targetDirY = 1,targetScale = 1)
{
	var index = array_length(spawnList);
	
	spawnList[array_length(spawnList)] = 
	{
		enemyX: targetEnemyX,
		enemyY: targetEnemyY,
		
        enemyObject: targetEnemyObject,
		
		enemyAISetup: targetEnemyAISetup,
		enemyAISetupArg: targetEnemyAISetupArg,
		
		dirX: targetDirX,
		dirY: targetDirY,
		scale: targetScale,
		
		nextTimer: targetNextTimer,
		spawnTimer: targetSpawnTimer
    };
	
	return index;
}