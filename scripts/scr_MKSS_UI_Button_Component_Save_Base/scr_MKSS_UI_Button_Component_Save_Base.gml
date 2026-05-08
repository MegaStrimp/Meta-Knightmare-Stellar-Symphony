///@description MKSS - UI - Button - Component - Save - Base

function scr_MKSS_UI_Button_Component_Save_Base(targetNum)
{
	#region Position
	saveButtonPatternX = ((saveButtonPatternX + .25) + 200) % 200;
	saveSelectLerp = lerp(saveSelectLerp,!isSelected,.1);
	
	x = obj_MKSS_Menu_TitleScreen.saveButtonX + (saveSelectLerp * 23);
	#endregion
}