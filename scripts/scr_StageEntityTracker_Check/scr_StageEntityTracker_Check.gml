///@description Stage Entity Tracker - Check

function scr_StageEntityTracker_Check(targetEntity = id,canDestroy = true)
{
	var check = ((global.hasStageEntityTracker) and (ds_exists(global.stageEntityTracker,ds_type_list)) and (ds_list_find_index(global.stageEntityTracker,id) != -1))
	
	if ((canDestroy) and (check))
	{
		instance_destroy(targetEntity);
	}
	
	return check;
}