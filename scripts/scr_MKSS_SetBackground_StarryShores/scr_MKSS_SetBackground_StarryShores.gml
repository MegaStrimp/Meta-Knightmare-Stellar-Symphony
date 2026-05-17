///@description MKSS - Set Background - Starry Shores

function scr_MKSS_SetBackground_StarryShores()
{
	if (backgroundSetup)
	{
		backgroundAnchor = layer_get_depth(layer_get_id("Background"));
		
		var arrayIndex = 0;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_StarryShores_Sky);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_StarryShores_Stars3);
		backgroundX[arrayIndex] = 0;
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_StarryShores_Stars2);
		backgroundX[arrayIndex] = 0;
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_StarryShores_Moon);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_StarryShores_Stars1);
		backgroundX[arrayIndex] = 0;
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_StarryShores_Ocean3);
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_StarryShores_Ocean2);
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_StarryShores_Ocean1);
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_StarryShores_MoonReflection);
		layer_background_alpha(backgroundIndex[arrayIndex],.5);
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
	var _ypos = camY / (room_height - camera_get_view_height(mainView));
	var bgWidth = sprite_get_width(bg_MKSS_StarryShores_Sky);
	var bgHeight = sprite_get_height(bg_MKSS_StarryShores_Sky);
	
	var arrayIndex = 0;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height)
	{
		layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	}
	else
	{
		layer_y(backgroundLayer[arrayIndex],(room_height - bgHeight));
	}
	arrayIndex += 1;
	if (!global.pause) backgroundX[arrayIndex] = (backgroundX[arrayIndex] - .2) % bgWidth;
	layer_x(backgroundLayer[arrayIndex],camX - (camX * .1) + backgroundX[arrayIndex]);
	if (bgHeight <= room_height)
	{
		layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	}
	else
	{
		layer_y(backgroundLayer[arrayIndex],(room_height - bgHeight));
	}
	arrayIndex += 1;
	if (!global.pause) backgroundX[arrayIndex] = (backgroundX[arrayIndex] - .4) % bgWidth;
	layer_x(backgroundLayer[arrayIndex],camX - (camX * .2) + backgroundX[arrayIndex]);
	if (bgHeight <= room_height)
	{
		layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	}
	else
	{
		layer_y(backgroundLayer[arrayIndex],(room_height - bgHeight));
	}
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height)
	{
		layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	}
	else
	{
		layer_y(backgroundLayer[arrayIndex],(room_height - bgHeight));
	}
	arrayIndex += 1;
	if (!global.pause) backgroundX[arrayIndex] = (backgroundX[arrayIndex] - .6) % bgWidth;
	layer_x(backgroundLayer[arrayIndex],camX - (camX * .3) + backgroundX[arrayIndex]);
	if (bgHeight <= room_height)
	{
		layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	}
	else
	{
		layer_y(backgroundLayer[arrayIndex],(room_height - bgHeight));
	}
	arrayIndex += 1;
	layer_x(backgroundLayer[arrayIndex],camX - (camX * .1));
	if (bgHeight <= room_height)
	{
		layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	}
	else
	{
		layer_y(backgroundLayer[arrayIndex],(room_height - bgHeight));
	}
	arrayIndex += 1;
	layer_x(backgroundLayer[arrayIndex],camX - (camX * .2));
	if (bgHeight <= room_height)
	{
		layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	}
	else
	{
		layer_y(backgroundLayer[arrayIndex],(room_height - bgHeight));
	}
	arrayIndex += 1;
	layer_x(backgroundLayer[arrayIndex],camX - (camX * .3));
	if (bgHeight <= room_height)
	{
		layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	}
	else
	{
		layer_y(backgroundLayer[arrayIndex],(room_height - bgHeight));
	}
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height)
	{
		layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	}
	else
	{
		layer_y(backgroundLayer[arrayIndex],(room_height - bgHeight));
	}
	arrayIndex += 1;
	layer_x(backgroundLayer[arrayIndex],(layer_get_x(backgroundLayer[arrayIndex]) - .2) % 16);
}