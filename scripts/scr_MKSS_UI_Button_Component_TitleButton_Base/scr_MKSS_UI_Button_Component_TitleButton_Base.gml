///@description MKSS - UI - Button - Component - Title Button - Base

function scr_MKSS_UI_Button_Component_TitleButton_Base()
{
	#region Position
	miscButtonLerp = lerp(miscButtonLerp,isSelected,.1);
	
	y = obj_MKSS_Menu_TitleScreen.miscButtonY - (miscButtonLerp * 6);
	
	if (isSelected) obj_MKSS_Menu_TitleScreen.currentButtonText = buttonText;
	#endregion
}