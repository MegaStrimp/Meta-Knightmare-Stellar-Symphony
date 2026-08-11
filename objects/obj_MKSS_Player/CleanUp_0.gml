///@description Clean Up

#region Event Inherited
event_inherited();
#endregion

#region Destroy Lists
if (ds_exists(MKSS_HurtElement,ds_type_list)) ds_list_destroy(MKSS_HurtElement);
#endregion