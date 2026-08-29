///@description Entity - Hit List - Check

function scr_Entity_HitList_Check(targetObject,targetAttack)
{
	scr_Entity_HitList_CleanUp(targetObject);
	
	return (ds_list_find_index(targetObject.hitList,targetAttack) != -1);
}