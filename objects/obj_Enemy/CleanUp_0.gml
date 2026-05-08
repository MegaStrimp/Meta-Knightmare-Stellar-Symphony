///@description Clean Up

#region Destroy Lists
if (ds_exists(attackTypes,ds_type_list)) ds_list_destroy(attackTypes);
ds_map_destroy(attackTypeResistances);
#endregion

#region Clean Up
if (enemyCleanUp != -1) script_execute(enemyCleanUp);
if (enemyAICleanUp != -1) script_execute(enemyAICleanUp);
#endregion