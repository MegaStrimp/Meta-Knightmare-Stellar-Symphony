///@description Begin Step

#region Variables
localPause = global.pauseFinal;
speedMultFinal = global.speedMultGlobal * global.deltaTime;
#endregion

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