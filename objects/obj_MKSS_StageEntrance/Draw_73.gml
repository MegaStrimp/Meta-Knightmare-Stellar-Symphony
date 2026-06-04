///@description Draw End

if (isActive)
{
	#region Title
	var color = "[#FFFFFF]";
	var offset = 0;
	
	if (isCompleted)
	{
		color = "[#FFD800]";
		draw_sprite(spr_MKSS_Menu_Common_Completion,0,camera_get_view_x(mainView) + (global.gameWidth / 2) - 8,camera_get_view_y(mainView) + 16);
	}
	
	var titleText = scribble(color + string(global.MKSS_StageList[selection].name) + "[/color]");
	titleText.align(fa_center).wrap(global.gameWidth / 2).draw(camera_get_view_x(mainView) + (global.gameWidth / 2),camera_get_view_y(mainView) + 4);
	
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("L"))];
	if (targetIcon != undefined) draw_sprite(targetIcon,0,camera_get_view_x(mainView) + (global.gameWidth / 2) - (titleText.get_width() / 2) - 18,camera_get_view_y(mainView) + 2 + (2 * (buttonInputTimerComponent_LTimer != -1)));
	
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("R"))];
	if (targetIcon != undefined) draw_sprite(targetIcon,0,camera_get_view_x(mainView) + (global.gameWidth / 2) + (titleText.get_width() / 2) + 7,camera_get_view_y(mainView) + 2 + (2 * (buttonInputTimerComponent_RTimer != -1)));
	#endregion
	
	#region Collectibles
	var collectibleList = global.MKSS_StageList[selection].collectibles;
	
	for (var i = 0; i < array_length(collectibleList); i++)
	{
		if (collectibleList[i].icon != undefined)
		{
			var waveX = sine_wave(current_time / 4200,1,1,0);
			var waveY = sine_wave(current_time / (4500 + (4500 * i)),.8,1.1,0);
			
			if (!collectibleList[i].isObtained) gpu_set_fog(true,c_black,0,0);
			draw_sprite(collectibleList[i].icon,0,x + 14 + (18 * i) + waveX,y - 2 - (2 * i) + waveY);
			if (!collectibleList[i].isObtained) gpu_set_fog(false,c_white,0,0);
		}
	}
	#endregion
	
	#region Button Hints
	var startIcon = "";
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
	if (targetIcon != undefined) startIcon = "[" + sprite_get_name(targetIcon) + "]";
	
	scribble(startIcon + " Start").align(fa_right).draw(camera_get_view_x(mainView) + (global.gameWidth / 2) + 72,y + 16 + (2 * (buttonInputTimerComponent_ATimer != -1)));
	
	var exitIcon = "";
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
	if (targetIcon != undefined) exitIcon = "[" + sprite_get_name(targetIcon) + "]";
	
	scribble(exitIcon + " Back").draw(camera_get_view_x(mainView) + (global.gameWidth / 2) - 72,y + 16 + (2 * (buttonInputTimerComponent_BTimer != -1)));
	#endregion
}