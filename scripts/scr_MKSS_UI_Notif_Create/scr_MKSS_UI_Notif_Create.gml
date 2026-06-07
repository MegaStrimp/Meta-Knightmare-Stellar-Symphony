///@description MKSS - UI - Notif - Create

function scr_MKSS_UI_Notif_Create(targetNotifID)
{
	var notifBox = instance_create_depth(0,0,-999,obj_MKSS_UI_NotifBox);
	with (notifBox)
	{
        text = global.MKSS_NotifList[targetNotifID].text;
		pageMax = array_length(text) - 1;
        image = global.MKSS_NotifList[targetNotifID].image;
        xScale = global.MKSS_NotifList[targetNotifID].xScale;
        yScale = global.MKSS_NotifList[targetNotifID].yScale;
        nextText = global.MKSS_NotifList[targetNotifID].nextText;
        nextScript = global.MKSS_NotifList[targetNotifID].nextScript;
        backText = global.MKSS_NotifList[targetNotifID].backText;
        backScript = global.MKSS_NotifList[targetNotifID].backScript;
        inputDelayTimer = global.MKSS_NotifList[targetNotifID].inputDelayTimer;
	}
}