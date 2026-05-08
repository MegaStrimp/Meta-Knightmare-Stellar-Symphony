///@description Settings - Component - Window Size - Draw

function scr_Settings_Component_WindowSize_Draw(targetIndex)
{
	var font = "[fnt_Advance_Gray]";
	if (selection == i) font = "[fnt_Advance]";
	
	scribble(font + global.settingsList[selectionIndex].title + "\t" + string(global.windowScaleTarget) + "[/font]").draw(startX + 12,startY + (separation * i));
}