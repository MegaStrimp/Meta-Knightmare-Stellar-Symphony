///@description Destroy

#region Event Inherited
event_inherited();
#endregion

#region Arena
if (arenaIndex != -1)
{
	with (arenaIndex)
	{
		spawnedEnemyCount -= 1;
	}
}
#endregion