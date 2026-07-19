///@description Stage Entity Tracker - Add

function scr_StageEntityTracker_Add(targetEntity = id)
{
	if ((global.hasStageEntityTracker) and (ds_exists(global.stageEntityTracker,ds_type_list)))
	{
		ds_list_add(global.stageEntityTracker,targetEntity);
	}
}