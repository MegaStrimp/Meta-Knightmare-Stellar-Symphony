///@description Draw End

if (isActive)
{
	if (global.shaders) pal_swap_set(currentSprite,1,false);
	
	#region Scratch
	if (scratchTimer != -1) draw_sprite(spr_MKSS_PaintChanger_Scratch,scratchIndex,scratchX,scratchY);
	#endregion
	
	#region Spray Can
	draw_sprite(spr_MKSS_PaintChanger_SprayCan,0,x,y - 27 - (2 * (sprayCanBounceTimer != -1)));
	#endregion
	
	if (global.shaders) pal_swap_reset();
	
	#region Completion
	var color = "[#FFFFFF]";
	var offset = 0;
	
	if (isCompleted)
	{
		color = "[#FFD800]";
		offset = 17;
		draw_sprite(spr_MKSS_Menu_Common_Completion,0,camera_get_view_x(mainView) + 41,camera_get_view_y(mainView) + 28);
	}
	
	scribble(color + string(paletteListCount) + "/" + string(ds_map_size(global.MKSS_SprayPaintIDs)) + "[/color]").draw(camera_get_view_x(mainView) + 43 + offset,camera_get_view_y(mainView) + 30);
	#endregion
	
	#region Spray Paint Title
	scribble(currentName).align(fa_center).draw(x,y - 48 - (2 * (sprayCanBounceTimer != -1)));
	#endregion
	
	#region Button Hints
	if (paletteListCount > 1)
	{
		var targetIcon = global.UI_IconBindings[? string(input_binding_get("left"))];
		if (targetIcon != undefined) draw_sprite(targetIcon,0,x - 21,y - 32 + (2 * (buttonInputTimerComponent_LeftTimer != -1)));
		
		var targetIcon = global.UI_IconBindings[? string(input_binding_get("right"))];
		if (targetIcon != undefined) draw_sprite(targetIcon,0,x + 10,y - 32 + (2 * (buttonInputTimerComponent_RightTimer != -1)));
	}
	
	var exitIcon = "";
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
	if (targetIcon != undefined) exitIcon = "[" + sprite_get_name(targetIcon) + "]";
	
	scribble(exitIcon + " BACK").draw(x - 72,y + (2 * (buttonInputTimerComponent_BTimer != -1)));
	#endregion
}