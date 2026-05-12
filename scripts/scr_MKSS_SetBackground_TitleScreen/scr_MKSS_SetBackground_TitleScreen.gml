///@description MKSS - Set Background - TitleScreen

function scr_MKSS_SetBackground_TitleScreen()
{
	if (backgroundSetup)
	{
		backgroundAnchor = layer_get_depth(layer_get_id("Background"));
		
		var arrayIndex = 0;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],spr_MKSS_Menu_PauseScreen_Upgrades_Bg);
		backgroundX[arrayIndex] = 0;
		backgroundY[arrayIndex] = 0;
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		layer_background_vtiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],spr_MKSS_Menu_PauseScreen_Upgrades_BgStars1);
		backgroundX[arrayIndex] = 0;
		backgroundY[arrayIndex] = 0;
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		layer_background_vtiled(backgroundIndex[arrayIndex],true);
		arrayIndex += 1;
		backgroundLayer[arrayIndex] = layer_create(backgroundAnchor - (arrayIndex + 1));
		backgroundIndex[arrayIndex] = layer_background_create(backgroundLayer[arrayIndex],spr_MKSS_Menu_PauseScreen_Upgrades_BgStars2);
		backgroundX[arrayIndex] = 0;
		backgroundY[arrayIndex] = 0;
		layer_background_htiled(backgroundIndex[arrayIndex],true);
		layer_background_vtiled(backgroundIndex[arrayIndex],true);
		
		backgroundSetup = false;
	}
	
	if (!global.pause)
	{
		var arrayIndex = 0;
		backgroundX[arrayIndex] = (backgroundX[arrayIndex] + .2) % 160;
		backgroundY[arrayIndex] = (backgroundY[arrayIndex] + .075) % 160;
		layer_x(backgroundLayer[arrayIndex],backgroundX[arrayIndex]);
		layer_y(backgroundLayer[arrayIndex],backgroundY[arrayIndex]);
		arrayIndex += 1;
		backgroundX[arrayIndex] = (backgroundX[arrayIndex] + .16) % 160;
		backgroundY[arrayIndex] = (backgroundY[arrayIndex] + .06) % 160;
		layer_x(backgroundLayer[arrayIndex],backgroundX[arrayIndex]);
		layer_y(backgroundLayer[arrayIndex],backgroundY[arrayIndex]);
		arrayIndex += 1;
		backgroundX[arrayIndex] = (backgroundX[arrayIndex] + .12) % 160;
		backgroundY[arrayIndex] = (backgroundY[arrayIndex] + .04) % 160;
		layer_x(backgroundLayer[arrayIndex],backgroundX[arrayIndex]);
		layer_y(backgroundLayer[arrayIndex],backgroundY[arrayIndex]);
	}
}