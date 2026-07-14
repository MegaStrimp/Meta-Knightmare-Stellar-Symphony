///@description Draw End

if (isActive)
{
	#region Title
	var titleText = scribble("Familiars");
	titleText.align(fa_center).draw(x,camera_get_view_y(mainView) + 4);
	
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("L"))];
	if (targetIcon != undefined) draw_sprite(targetIcon,0,x - (titleText.get_width() / 2) - 20,camera_get_view_y(mainView) + 2 + (2 * (buttonInputTimerComponent_LTimer != -1)));
	
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("R"))];
	if (targetIcon != undefined) draw_sprite(targetIcon,0,x + (titleText.get_width() / 2) + 9,camera_get_view_y(mainView) + 2 + (2 * (buttonInputTimerComponent_RTimer != -1)));
	#endregion
	
	#region Completion
	var color = "[c_white]";
	var offset = 0;
	
	if (isCompleted)
	{
		color = "[" + MKSS_Base_Color_Completion + "]";
		offset = 17;
		draw_sprite(spr_MKSS_Menu_Common_Completion,0,camera_get_view_x(mainView) + 41,camera_get_view_y(mainView) + 28);
	}
	
	scribble(color + string(familiarListCount) + "/" + string(ds_map_size(global.MKSS_FamiliarIDs)) + "[/color]").draw(camera_get_view_x(mainView) + 43 + offset,camera_get_view_y(mainView) + 30);
	#endregion
	
	#region Familiar Title
	scribble(currentName).align(fa_center).draw(x,y - 48 - (2 * (familiarBounceTimer != -1)));
	#endregion
	
	#region Familiar Sprite
	if (currentSprite != undefined) draw_sprite(currentSprite,0,x,y - 27 - (2 * (familiarBounceTimer != -1)));
	#endregion
	
	#region Button Hints
	if (familiarListCount > 1)
	{
		var targetIcon = global.UI_IconBindings[? string(input_binding_get("left"))];
		if (targetIcon != undefined) draw_sprite(targetIcon,0,x - 21,y - 32 + (2 * (buttonInputTimerComponent_LeftTimer != -1)));
		
		var targetIcon = global.UI_IconBindings[? string(input_binding_get("right"))];
		if (targetIcon != undefined) draw_sprite(targetIcon,0,x + 10,y - 32 + (2 * (buttonInputTimerComponent_RightTimer != -1)));
	}
	
	var exitIcon = "";
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
	if (targetIcon != undefined) exitIcon = "[" + sprite_get_name(targetIcon) + "]";
	
	scribble(exitIcon + " Back").draw(camera_get_view_x(mainView) + (global.gameWidth / 2) - 72,y + 16 + (2 * (buttonInputTimerComponent_BTimer != -1)));
	#endregion
}