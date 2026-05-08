///@description MKSS - Attack - Execute - Galaxia - Slash 1

function scr_MKSS_Attack_Execute_ChunkyDee_ThrowGordo()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Owner Variables
	var nearestPlayer = instance_nearest(x,y,obj_Player);
	
	dirX = 1;
	if (nearestPlayer.x < x) dirX = -1;
	
	ds_list_clear(thrownEnemyList);
	ds_list_clear(thrownEnemyStateList);
	
	var enemyCount = 1;
	
	for (var i = 0; i < enemyCount; i++)
	{
		ds_list_add(thrownEnemyList,obj_MKSS_Enemy_Gordo);
		ds_list_add(thrownEnemyStateList,scr_MKSS_Enemy_Gordo_AI_Bounce_Setup);
	}
	
	scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_ChunkyDee_AI_Normal_ThrowEnemy_Step);
	#endregion
}