///@description UI - Button - Select

function scr_UI_Button_Select(targetButtonID)
{
	with (obj_UI_Button)
	{
		isSelected = (ID == targetButtonID);
	}
	
	scr_Debug_WriteLog("Selected = " + string(targetButtonID));
}