///@description MKSS - Pause - Draw End

function scr_MKSS_Pause_DrawEnd()
{
	#region Variables
	var xx = camera_get_view_x(mainView);
	var yy = camera_get_view_y(mainView);
	#endregion
	
	#region Overlay
	if (MKSS_GamePause_OverlayAlpha != 0)
	{
		draw_set_color(make_color_rgb(32,45,76));
		draw_set_alpha(MKSS_GamePause_OverlayAlpha);
		draw_rectangle(xx,yy,xx + global.gameWidth,yy + global.gameHeight,false);
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
	#endregion
	
	#region Decals
	if ((global.shaders) and (MKSS_GamePause_DecalPalette != -1)) pal_swap_set(MKSS_GamePause_DecalPalette,1,false);
	draw_sprite(spr_MKSS_UI_Decal1,0,xx + lengthdir_x(MKSS_GamePause_DecalLength,45),yy + 160 + lengthdir_y(MKSS_GamePause_DecalLength,45));
	draw_sprite(spr_MKSS_UI_Decal2,0,xx + 240 + lengthdir_x(-MKSS_GamePause_DecalLength,45),yy + lengthdir_y(-MKSS_GamePause_DecalLength,45));
	if ((global.shaders) and (MKSS_GamePause_DecalPalette != -1)) pal_swap_reset();
	#endregion
	
	#region Upgrades Circles
	#region Create Surface
	var circleCol = c_black;
	
	var waveX = sine_wave(current_time / 4200,1,1,0);
	var waveY = sine_wave(current_time / 4500,.8,1.1,0);
	
	var surfaceWidth = global.gameWidth;
	var surfaceHeight = global.gameHeight;
	
	if (!surface_exists(MKSS_GamePause_CircleSurface)) MKSS_GamePause_CircleSurface = surface_create(surfaceWidth,surfaceHeight);
	
	surface_set_target(MKSS_GamePause_CircleSurface);
	draw_clear_alpha(c_black,0);
	
	draw_circle_color(123 + waveX,MKSS_GamePause_Upgrades_ButtonY + waveY,21,circleCol,circleCol,false);
	
	for (var i = 0; i < MKSS_GamePause_CircleCount; i++)
	{
		var sineTarget = sine_wave(current_time / 2000,MKSS_GamePause_CirclePer[i],MKSS_GamePause_CircleAmp[i] * MKSS_GamePause_CircleZoom,0) * MKSS_GamePause_CircleDir[i];
		
		draw_circle_color(123 + waveX + lengthdir_x(15 + sineTarget,MKSS_GamePause_CircleAngle[i]),MKSS_GamePause_Upgrades_ButtonY + waveY + lengthdir_y(15 + sineTarget,MKSS_GamePause_CircleAngle[i]),MKSS_GamePause_CircleRad[i] * MKSS_GamePause_CircleZoom,circleCol,circleCol,false);
	}
	
	surface_reset_target();
	#endregion
	
	#region Outline
	if (!surface_exists(MKSS_GamePause_CircleSurfaceOutline)) MKSS_GamePause_CircleSurfaceOutline = surface_create(surfaceWidth,surfaceHeight);
	
	surface_set_target(MKSS_GamePause_CircleSurfaceOutline);
	draw_clear_alpha(c_black,0);
	
	if (global.shaders)
	{
		var texelW = 1.0 / surfaceWidth;
		var texelH = 1.0 / surfaceHeight;
		
		shader_set(shd_ColoredOutline);
		shader_set_uniform_f(MKSS_GamePause_CircleSurface_PixelW,texelW);
		shader_set_uniform_f(MKSS_GamePause_CircleSurface_PixelH,texelH);
		shader_set_uniform_f(MKSS_GamePause_CircleSurface_OutlineColor,1,1,1);
	}
	
	draw_surface(MKSS_GamePause_CircleSurface,0,0);
	
	if (global.shaders) shader_reset();
	
	surface_reset_target();
	
	draw_surface_ext(MKSS_GamePause_CircleSurfaceOutline,xx,yy,1,1,0,c_white,MKSS_GamePause_UpgradesAlpha);
	#endregion
	
	#region Draw Surface
	scr_DrawMask_Begin(xx,yy,xx + global.gameWidth,yy + global.gameHeight);
	
	draw_surface_ext(MKSS_GamePause_CircleSurface,xx,yy,1,1,0,c_white,MKSS_GamePause_UpgradesAlpha);
	
	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true,true,true,true);
	
	gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
	gpu_set_alphatestenable(true);
	draw_set_alpha(1);
	
	for (var ix = 0; ix < 5; ix++)
	{
		for (var iy = 0; iy < 5; iy++)
		{
			draw_sprite_ext(MKSS_GamePause_CircleBg,0,xx + MKSS_GamePause_CircleBgX + ((ix - 2) * MKSS_GamePause_CircleBgWidth),yy + MKSS_GamePause_CircleBgY + ((iy - 2) * MKSS_GamePause_CircleBgHeight),1,1,0,c_white,1);
			draw_sprite_ext(MKSS_GamePause_CircleBgStars1,0,xx + MKSS_GamePause_CircleBgStars1X + ((ix - 2) * MKSS_GamePause_CircleBgStars1Width),yy + MKSS_GamePause_CircleBgStars1Y + ((iy - 2) * MKSS_GamePause_CircleBgStars1Height),1,1,0,c_white,1);
			draw_sprite_ext(MKSS_GamePause_CircleBgStars2,0,xx + MKSS_GamePause_CircleBgStars2X + ((ix - 2) * MKSS_GamePause_CircleBgStars2Width),yy + MKSS_GamePause_CircleBgStars2Y + ((iy - 2) * MKSS_GamePause_CircleBgStars2Height),1,1,0,c_white,1);
		}
	}
	
	scr_DrawMask_End();
	#endregion
	#endregion
	
	#region Settings
	scr_DrawMask_Begin(xx,yy,xx + global.gameWidth,yy + global.gameHeight);
	
	draw_set_alpha(1);
	draw_rectangle(xx,yy,xx + MKSS_GamePause_Settings_TransitionX,yy + 160,false);
	draw_sprite(spr_MKSS_Menu_PauseScreen_Settings_Transition,0,xx + MKSS_GamePause_Settings_TransitionX,yy);
	draw_set_alpha(0);
	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true,true,true,true);
	
	gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
	gpu_set_alphatestenable(true);
	draw_set_alpha(1);
	
	for (var i = 0; i < 3; i++)
	{
		draw_sprite(spr_MKSS_Menu_PauseScreen_Settings_Background_2,0,xx,yy - (160 * (i - 1)) + sine_wave(current_time / 1000,12,64,0));
		draw_sprite(spr_MKSS_Menu_PauseScreen_Settings_Background_1,0,xx,yy - (224 * (i - 1)) + MKSS_GamePause_Settings_BackgroundY);
	}
	
	scr_DrawMask_End();
	
	if (MKSS_GamePause_SettingsActive)
	{
		for (var i = 0; i < array_length(MKSS_GamePause_Settings_Cog); i++)
		{
			if ((MKSS_GamePause_Settings_Cog[i].appearTimer == -1) and (MKSS_GamePause_Settings_Cog[i].disappearTimer != -1)) draw_sprite(spr_MKSS_Menu_PauseScreen_Settings_Cog,0,xx + MKSS_GamePause_Settings_Cog[i].x,yy + MKSS_GamePause_Settings_Cog[i].y);
		}
	}
	#endregion
	
	#region Buttons
	var waveX = 0;
	var waveY = 0;
	
	waveX = sine_wave(current_time / 4200,1,1,0);
	waveY = sine_wave(current_time / 4500,.8,1.1,0);
	draw_sprite_ext(spr_MKSS_Menu_PauseScreen_UpgradesButton,MKSS_GamePause_Upgrades_ButtonIndex,xx + 123 + waveX,yy + MKSS_GamePause_Upgrades_ButtonY + waveY,1,1,image_angle,c_white,MKSS_GamePause_PauseButtonAlpha);
	
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("Y"))];
	if (targetIcon != undefined) draw_sprite_ext(targetIcon,0,xx + 123 + 24 + waveX,yy + MKSS_GamePause_Upgrades_ButtonY + 2 + waveY,1,1,image_angle,c_white,MKSS_GamePause_PauseButtonAlpha);
	
	waveX = -sine_wave(current_time / 4800,1,1,0);
	waveY = -sine_wave(current_time / 4700,1,1.2,0);
	draw_sprite_ext(spr_MKSS_Menu_PauseScreen_SettingsButton,MKSS_GamePause_SettingsButtonIndex,xx + 55 + waveX,yy + MKSS_GamePause_SettingsButtonY + waveY,1,1,image_angle,c_white,MKSS_GamePause_PauseButtonAlpha);
	
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("X"))];
	if (targetIcon != undefined) draw_sprite_ext(targetIcon,0,xx + 55 + 26 + waveX,yy + MKSS_GamePause_SettingsButtonY + 16 + waveY,1,1,image_angle,c_white,MKSS_GamePause_PauseButtonAlpha);
	
	waveX = sine_wave(current_time / 4100,1,1,0);
	waveY = sine_wave(current_time / 4300,1.15,1.15,0);
	draw_sprite_ext(spr_MKSS_Menu_PauseScreen_ExitButton,MKSS_GamePause_ExitButtonIndex,xx + 190 + waveX,yy + MKSS_GamePause_ExitButtonY + waveY,1,1,image_angle,c_white,MKSS_GamePause_PauseButtonAlpha);
	
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
	if (targetIcon != undefined) draw_sprite_ext(targetIcon,0,xx + 190 + 7 + waveX,yy + MKSS_GamePause_ExitButtonY + 18 + waveY,1,1,image_angle,c_white,MKSS_GamePause_PauseButtonAlpha);
	
	waveX = -sine_wave(current_time / 4500,1,1,0);
	waveY = -sine_wave(current_time / 4300,1.05,.85,0);
	draw_sprite_ext(spr_MKSS_Menu_PauseScreen_ReturnButton,MKSS_GamePause_ReturnButtonIndex,xx + 120 + waveX,yy + MKSS_GamePause_ReturnButtonY + waveY,1,1,image_angle,c_white,MKSS_GamePause_PauseButtonAlpha);
	
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
	if (targetIcon != undefined) draw_sprite_ext(targetIcon,0,xx + 120 + 26 + waveX,yy + MKSS_GamePause_ReturnButtonY + 10 + waveY,1,1,image_angle,c_white,MKSS_GamePause_PauseButtonAlpha);
	#endregion
}