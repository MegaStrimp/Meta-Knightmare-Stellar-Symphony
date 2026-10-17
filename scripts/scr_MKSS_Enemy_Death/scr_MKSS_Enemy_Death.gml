///@description MKSS - Enemy - Death

function scr_MKSS_Enemy_Death(targetEnemy)
{
	with (targetEnemy)
	{
		if (deathParticleIndex != -1) script_execute(deathParticleIndex,x,y);
		
		var isTracked = false;
		if ((global.hasStageEntityTracker) and (ds_exists(global.stageEntityTracker,ds_type_list)))
		{
			if (ds_list_find_index(global.stageEntityTracker,id) != -1)
			{
				isTracked = true;
			}
			else
			{
				ds_list_add(global.stageEntityTracker,id);
			}
		}
		
		if (!isTracked) scr_MKSS_Score_Add(points);
		
		instance_destroy();
	}
	
	var roomHasEnemies = instance_exists(obj_MKSS_EnemyArena);
	
	if (!roomHasEnemies)
	{
		with (obj_Enemy)
		{
			if ((targetEnemy != self) and (hp != -1))
			{
				roomHasEnemies = true;
				break;
			}
		}
	}
	
	if (!roomHasEnemies)
	{
		with (obj_EnemySpawner)
		{
			if (!ds_list_find_index(spawnedEnemyIndexes,targetEnemy))
			{
				roomHasEnemies = true;
				break;
			}
		}
	}
	
	if (!roomHasEnemies)
	{
		scr_MKSS_UI_BackgroundOverlay_Create(10,layer_get_depth("Player") + 1,false,[c_white],,true).alpha = .2;
	}
}