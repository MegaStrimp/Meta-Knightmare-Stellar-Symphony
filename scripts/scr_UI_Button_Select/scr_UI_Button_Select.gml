///@description UI - Button - Select

function scr_UI_Button_Select(targetButtonID)
{
	scr_PlaySfx(snd_MKSS_Select); //STRIMPTODO Split
	
	with (obj_UI_Button)
	{
		isSelected = (ID == targetButtonID);
	}
	
	scr_Debug_WriteLog("Selected = " + string(targetButtonID));
}