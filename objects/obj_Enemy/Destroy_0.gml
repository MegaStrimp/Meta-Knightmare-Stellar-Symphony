///@description Destroy

#region Remove From Spawner
if ((hp <= 0) and (spawnerIndex != -1))
{
	with (spawnerIndex)
	{
		ds_list_delete(spawnedEnemyIndexes,ds_list_find_index(spawnedEnemyIndexes,other));
	}
}
#endregion