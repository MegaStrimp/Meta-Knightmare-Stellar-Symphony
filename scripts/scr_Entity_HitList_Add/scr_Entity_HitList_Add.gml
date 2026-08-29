///@description Entity - Hit List - Add

function scr_Entity_HitList_Add(targetObject,targetAttack)
{
	ds_list_add(targetObject.hitList,targetAttack);
}