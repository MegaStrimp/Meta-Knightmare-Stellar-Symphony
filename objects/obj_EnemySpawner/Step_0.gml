///@description Main

if (!localPause)
{
	#region Spawn Timer
	if (spawnTimer != -1)
	{
		spawnTimer = max(spawnTimer - speedMultFinal,0);
		if (spawnTimer == 0)
		{
			if ((canSpawnEnemy) and (enemyObject != -1) and ((!scr_Entity_OutsideView(32)) or (bypassViewCheck)))
			{
				if (enemySpawnSound != -1) scr_PlaySfx(enemySpawnSound);
				
				var tempSpawnedEnemyIndex = instance_create_depth(x,y,depth,enemyObject);
				
				ds_list_add(spawnedEnemyIndexes,tempSpawnedEnemyIndex);
				
				with (tempSpawnedEnemyIndex)
				{
					hasSpawner = other.enemyHasSpawner;
					if (other.owner != -1) arenaIndex = other.owner;
					spawnerIndex = other;
					
					dirX = other.dirX;
					dirY = other.dirY;
					scale = other.scale;
					
					image_xscale = dirX * scale;
					image_yscale = dirY * scale;
					
					if (other.enemyAISetup != -1) script_execute_ext(other.enemyAISetup,other.enemyAISetupArg);
				}
				
				canSpawnEnemy = false;
				
				if (destroyAfterSpawning) instance_destroy();
			}
			
			spawnTimer = spawnTimerMax;
		}
	}
	#endregion
}