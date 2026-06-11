///@description MKSS - UI - Notif - Create - Custom

function scr_MKSS_UI_Notif_Create_Custom(targetText,targetImage = [undefined],targetFont = "fnt_Advance",targetXScale = 3,targetYScale = 2)
{
	var notifBox = instance_create_depth(0,0,-999,obj_MKSS_UI_NotifBox);
	with (notifBox)
	{
        text = targetText;
		pageMax = array_length(text) - 1;
        image = targetImage;
		font = targetFont;
		xScale = targetXScale;
		yScale = targetYScale;
	}
	
	return notifBox;
}