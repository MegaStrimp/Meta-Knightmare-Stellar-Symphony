///@description MKSS - Set Background - Above Halberd

function scr_MKSS_SetBackground_AboveHalberd()
{
	if (backgroundSetup)
	{
		backgroundAnchor = layer_get_depth(layer_get_id("Background"));
		
		var arrayIndex = 0;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_AboveHalberd);
		backgroundX[arrayIndex] = 0;
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		instance_create_layer(0,0,backgroundLayer[arrayIndex],obj_MKSS_BgEnv_AboveHalberdThunder_Controller);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_Pit);
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		layer_y(backgroundLayer[arrayIndex],room_height - 32);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(layer_get_depth(layer_get_id("Player")) - 1);
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_Rain);
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		layer_background_vtiled(backgroundIndex[arrayIndex],true);
		
		backgroundSetup = false;
	}
	
	var camX = camera_get_view_x(mainView);
	var camY = camera_get_view_y(mainView);
	var _xpos = camX / (room_width - camera_get_view_width(mainView));
	_xpos = clamp(_xpos,0,room_width);
	var bgWidth = sprite_get_width(bg_MKSS_AboveHalberd);
	
	var arrayIndex = 0;
	if (!global.pauseFinal) backgroundX[arrayIndex] = (backgroundX[arrayIndex] - .4) % bgWidth;
	layer_x(backgroundLayer[arrayIndex],camX - (camX * .2) + backgroundX[arrayIndex]);
	layer_y(backgroundLayer[arrayIndex],camY);
	arrayIndex += 1;
	arrayIndex += 1;
	layer_x(backgroundLayer[arrayIndex],(layer_get_x(backgroundLayer[arrayIndex]) - .2) % 16);
	arrayIndex += 1;
	layer_background_speed(backgroundIndex[arrayIndex],!global.pauseFinal * 60);
	if (!global.pauseFinal)
	{
		layer_x(backgroundLayer[arrayIndex],(layer_get_x(backgroundLayer[arrayIndex]) - 3) % 16);
		layer_y(backgroundLayer[arrayIndex],(layer_get_y(backgroundLayer[arrayIndex]) + 3) % 16);
	}
}