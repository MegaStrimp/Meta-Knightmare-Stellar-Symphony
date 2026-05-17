///@description MKSS - Set Background - Royal Reeve

function scr_MKSS_SetBackground_RoyalReeve()
{
	if (backgroundSetup)
	{
		backgroundAnchor = layer_get_depth(layer_get_id("Background"));
		
		var arrayIndex = 0;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_RoyalReeveOld);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_Pit);
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		layer_y(backgroundLayer[arrayIndex],room_height - 32);
		
		backgroundSetup = false;
	}
	
	var camX = camera_get_view_x(mainView);
	var camY = camera_get_view_y(mainView);
	var _xpos = camX / (room_width - camera_get_view_width(mainView));
	_xpos = clamp(_xpos,0,room_width);
	var bgWidth = sprite_get_width(bg_MKSS_RoyalReeveOld);
	
	var arrayIndex = 0;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	layer_y(backgroundLayer[arrayIndex],camY);
	arrayIndex += 1;
	layer_x(backgroundLayer[arrayIndex],(layer_get_x(backgroundLayer[arrayIndex]) - .2) % 16);
}