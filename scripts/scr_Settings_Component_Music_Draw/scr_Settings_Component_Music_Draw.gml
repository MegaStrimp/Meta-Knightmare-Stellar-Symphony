///@description Settings - Component - Music - Draw

function scr_Settings_Component_Music_Draw(targetIndex)
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
		if (targetIcon != undefined) draw_sprite(targetIcon,0,startX + text.get_width() + 33 + (10 * 10),startY + (separation * i) - 2);
	}
	
	for (var h = -1; h < 10; h++)
	{
		var bubbleIsActive = (h < round(global.musicVolume * 10));
		var bubbleX = startX + text.get_width() + 34 + (10 * h);
		var bubbleY = startY + (separation * i) + 4;
		
		if (h != -1) draw_sprite(spr_6x6Mask_MiddleOrigin,!bubbleIsActive,bubbleX,bubbleY);
		
		if ((selection == i) and (mouse_check_button(mb_left)) and (scr_MouseIsInbetween(bubbleX - 4,bubbleY - 4,bubbleX + 4,bubbleY + 4)))
		{
			global.musicVolume = (h + 1) * .1;
		}
	}
}