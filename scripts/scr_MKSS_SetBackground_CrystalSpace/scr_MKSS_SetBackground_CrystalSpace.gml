///@description MKSS - Set Background - Crystal Space

function scr_MKSS_SetBackground_CrystalSpace()
{
	if (backgroundSetup)
	{
		backgroundAnchor = layer_get_depth(layer_get_id("Background"));
		
		var arrayIndex = 0;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace);
		
		backgroundSetup = false;
	}
	
	var camX = camera_get_view_x(mainView);
	var camY = camera_get_view_y(mainView);
	var _xpos = camX / (room_width - camera_get_view_width(mainView));
	_xpos = clamp(_xpos,0,room_width);
	var _ypos = camY / (room_height - camera_get_view_height(mainView));
	_ypos = clamp(_ypos,0,room_height);
	var bgWidth = sprite_get_width(bg_MKSS_CrystalSpace);
	var bgHeight = sprite_get_height(bg_MKSS_CrystalSpace);
	
	var arrayIndex = 0;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
}