///@description Entity - Hit List - Clean Up

function scr_Entity_HitList_CleanUp(targetObject)
{
	for (var i = 0; i < ds_list_size(targetObject.hitList); i++)
	{
		if (!instance_exists(ds_list_find_value(targetObject.hitList,i))) ds_list_delete(targetObject.hitList,i);
	}
}