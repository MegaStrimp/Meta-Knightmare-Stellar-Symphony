///@description MKSS - Settings - Component - Cursor - Draw

function scr_MKSS_Settings_Component_Cursor_Draw(targetIndex)
{
	var font = "[fnt_Advance_Gray]";
	if (selection == i) font = "[fnt_Advance]";
	
	text = scribble(font + global.settingsList[selectionIndex].title + "[/font]");
	text.draw(startX + 12,startY + (separation * i));
	
	if (selection == i)
	{
		var targetIcon = global.UI_IconBindings[? string(input_binding_get("left"))];
		if (targetIcon != undefined) draw_sprite(targetIcon,0,startX + text.get_width() + 14,startY + (separation * i) - 2);
		
		var targetIcon = global.UI_IconBindings[? string(input_binding_get("right"))];
		if (targetIcon != undefined) draw_sprite(targetIcon,0,startX + text.get_width() + 43,startY + (separation * i) - 2);
	}
	
	if (global.customCursorSprite != -1) if (global.customCursorSprite != -1) draw_sprite(global.customCursorSprite,global.customCursorSpriteIndex,startX + text.get_width() + 34,startY + (separation * i) + 4);
}