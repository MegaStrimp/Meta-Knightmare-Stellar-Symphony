///@description MKSS - UI - Button - Component - Save - Base

function scr_MKSS_UI_Button_Component_Save_Base(targetNum)
{
	#region Delete Save
	if ((obj_MKSS_Menu_TitleScreen.saveExists[targetNum]) and (!instance_exists(obj_MKSS_UI_NotifBox)))
	{
		if (input_check_pressed("Y",playerNum))
		{
			obj_MKSS_Menu_TitleScreen.currentSelectedSave = "Save" + string(targetNum + 1) + ".ini";
			
			scr_MKSS_ObtainNotif(global.MKSS_NotifIDs[? "deleteSave1"],true);
		}
	}
	#endregion
	
	#region Position
	saveButtonPatternX = ((saveButtonPatternX + .25) + 200) % 200;
	saveSelectLerp = lerp(saveSelectLerp,!isSelected,.1);
	
	x = obj_MKSS_Menu_TitleScreen.saveButtonX + (saveSelectLerp * 23) - ((1 - saveSelectLerp) * obj_MKSS_Menu_TitleScreen.saveExists[targetNum] * 23);
	
	if (isSelected) obj_MKSS_Menu_TitleScreen.currentButtonText = buttonText;
	#endregion
}