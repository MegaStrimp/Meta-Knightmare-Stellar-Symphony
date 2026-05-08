///@description MKSS - Enemy - Chunky Dee - AI - Normal - Clean Up

function scr_MKSS_Enemy_ChunkyDee_AI_Normal_CleanUp()
{
	ds_list_destroy(attackList);
	ds_list_destroy(thrownEnemyList);
	ds_list_destroy(thrownEnemyStateList);
}