///@description MKSS - Obtain Notif

function scr_MKSS_ObtainNotif(targetNotifID,forced = false)
{
	if ((!global.debug) and ((forced) or (!global.MKSS_NotifList[targetNotifID].isObtained)))
	{
		if (!forced) global.MKSS_NotifList[targetNotifID].isObtained = true;
		
		ds_list_add(global.MKSS_PopupQueue,targetNotifID);
		
		if (!instance_exists(obj_MKSS_UI_NotifBox))
		{
			scr_MKSS_UI_Notif_Create(targetNotifID);
			
			ds_list_delete(global.MKSS_PopupQueue,0);
		}
		
		if ((!forced) and (global.MKSS_NotifList[targetNotifID].isSavable)) scr_MKSS_SaveData("save1.ini");
	}
}