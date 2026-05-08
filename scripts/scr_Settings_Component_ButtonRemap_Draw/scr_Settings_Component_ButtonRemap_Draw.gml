///@description Settings - Component - Button Remap - Draw

function scr_Settings_Component_ButtonRemap_Draw(targetIndex)
{
	var font = "[fnt_Advance_Gray]";
	if (selection == i) font = "[fnt_Advance]";
	
	var text = scribble(font + global.settingsList[selectionIndex].title + "[/font]");
	text.draw(startX + 12,startY + (separation * i));
	
	var targetIcon = global.UI_IconBindings[? string(buttonRemap_KeysText[targetIndex])];
	draw_sprite(targetIcon,0,startX + 12 + text.get_width() + 6,startY + (separation * i) - 1);
}