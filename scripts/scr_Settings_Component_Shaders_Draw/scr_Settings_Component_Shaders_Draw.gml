///@description Settings - Component - Shaders - Draw

function scr_Settings_Component_Shaders_Draw(targetIndex)
{
	var font = "[fnt_Advance_Gray]";
	if (selection == i) font = "[fnt_Advance]";
	
	var text = "Enable Shaders";
	if (global.shaders) text = "Disable Shaders";
	scribble(font + text + "[/font]").draw(startX + 12,startY + (separation * i));
}