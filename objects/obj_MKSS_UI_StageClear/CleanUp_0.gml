///@description Clean Up

#region Destroy Lists
if (ds_exists(scoreBonuses,ds_type_list)) ds_list_destroy(scoreBonuses);
#endregion