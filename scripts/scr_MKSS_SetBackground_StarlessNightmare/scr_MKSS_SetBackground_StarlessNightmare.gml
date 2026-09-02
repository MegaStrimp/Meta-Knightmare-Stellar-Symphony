///@description MKSS - Set Background - Starless Nightmare

function scr_MKSS_SetBackground_StarlessNightmare()
{
	if (backgroundSetup)
	{
		backgroundAnchor = layer_get_depth(layer_get_id("Background"));
		
		var arrayIndex = 0;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_StarlessNightmare);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],bg_MKSS_Pit);
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		layer_y(backgroundLayer[arrayIndex],room_height - 32);
		
		backgroundSetup = false;
	}
	
	var arrayIndex = 0;
	layer_x(backgroundLayer[arrayIndex],0);
	layer_y(backgroundLayer[arrayIndex],0);
	arrayIndex += 1;
	layer_x(backgroundLayer[arrayIndex],(layer_get_x(backgroundLayer[arrayIndex]) - .2) % 16);
}