///@description MKSS - Set Background - Crystal Space

function scr_MKSS_SetBackground_CrystalSpace()
{
	if (backgroundSetup)
	{
		backgroundAnchor = layer_get_depth(layer_get_id("Background"));
		
		var arrayIndex = 0;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_Sky);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_SkyEternitySecret);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_SkyPlanet);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_HorizonClouds);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_StarsBack);
		backgroundX[arrayIndex] = 0;
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_StarsMiddle);
		backgroundX[arrayIndex] = 0;
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_StarsFront);
		backgroundX[arrayIndex] = 0;
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_Moon);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_IslandsBack);
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_BackPillars);
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_IslandsFront);
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_OceanBack);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_OceanMiddle);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_OceanFront);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_FrontPillars);
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_CrystalSpace_Clouds);
		backgroundX[arrayIndex] = 0;
		layer_background_htiled(backgroundIndex[arrayIndex],true);
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
	_ypos = clamp(_ypos,0,room_height);
	var bgWidth = sprite_get_width(bg_MKSS_CrystalSpace_Sky);
	var bgHeight = sprite_get_height(bg_MKSS_CrystalSpace_Sky);
	
	var arrayIndex = 0;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (!global.pauseFinal) backgroundX[arrayIndex] = (backgroundX[arrayIndex] - .1) % bgWidth;
	if (bgWidth <= room_width)
	{
		layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos * (1 + (arrayIndex / 25))) + backgroundX[arrayIndex]);
	}
	else
	{
		layer_x(backgroundLayer[arrayIndex],backgroundX[arrayIndex]);
	}
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (!global.pauseFinal) backgroundX[arrayIndex] = (backgroundX[arrayIndex] - .2) % bgWidth;
	if (bgWidth <= room_width)
	{
		layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos * (1 + (arrayIndex / 25))) + backgroundX[arrayIndex]);
	}
	else
	{
		layer_x(backgroundLayer[arrayIndex],backgroundX[arrayIndex]);
	}
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (!global.pauseFinal) backgroundX[arrayIndex] = (backgroundX[arrayIndex] - .3) % bgWidth;
	if (bgWidth <= room_width)
	{
		layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos * (1 + (arrayIndex / 25))) + backgroundX[arrayIndex]);
	}
	else
	{
		layer_x(backgroundLayer[arrayIndex],backgroundX[arrayIndex]);
	}
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos * (1 + (arrayIndex / 25))));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos * (1 + (arrayIndex / 25))));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos * (1 + (arrayIndex / 25))));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (bgWidth <= room_width) layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos * (1 + (arrayIndex / 25))));
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	if (!global.pauseFinal) backgroundX[arrayIndex] = (backgroundX[arrayIndex] - .5) % bgWidth;
	if (bgWidth <= room_width)
	{
		layer_x(backgroundLayer[arrayIndex],lerp(0,room_width - bgWidth,_xpos * (1 + (arrayIndex / 25))) + backgroundX[arrayIndex]);
	}
	else
	{
		layer_x(backgroundLayer[arrayIndex],backgroundX[arrayIndex]);
	}
	if (bgHeight <= room_height) layer_y(backgroundLayer[arrayIndex],lerp(0,room_height - bgHeight,_ypos));
	arrayIndex += 1;
	layer_x(backgroundLayer[arrayIndex],(layer_get_x(backgroundLayer[arrayIndex]) - .2) % 16);
}