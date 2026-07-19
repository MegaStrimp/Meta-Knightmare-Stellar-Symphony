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
}