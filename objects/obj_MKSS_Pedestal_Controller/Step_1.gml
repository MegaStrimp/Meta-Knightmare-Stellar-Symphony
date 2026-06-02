///@description Begin Step

#region Create Pedestal List
if (!ds_exists(pedestalList,ds_type_list))
{
	pedestalList = ds_list_create();
	
	with (obj_MKSS_Pedestal)
	{
		ds_list_add(other.pedestalList,id);
	}
}
#endregion