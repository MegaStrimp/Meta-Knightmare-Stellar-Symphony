///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

if (global.MKSS_CutsceneIsPaused)
{
	#region Overlay
	draw_set_color(c_black);
	draw_set_alpha(.5);
	draw_rectangle(xx,yy,xx + global.gameWidth,yy + global.gameHeight,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	#endregion
	
	#region Text
	scribble("[fnt_Advance] PAUSED [/font]").align(fa_center).draw(xx + (global.gameWidth / 2),yy + (global.gameHeight / 2));
	#endregion
	
	#region Button Hints
	var resumeIcon = "";
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("start"))];
	if (targetIcon != undefined) resumeIcon = "[" + sprite_get_name(targetIcon) + "]";
	
	var skipIcon = "";
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("select"))];
	if (targetIcon != undefined) skipIcon = "[" + sprite_get_name(targetIcon) + "]";
	
	scribble("[fnt_Advance]" + resumeIcon + " RESUME[/font]").draw(xx + 4,yy + global.gameHeight - 16);
	scribble("[fnt_Advance]" + skipIcon + " SKIP[/font]").align(fa_right).draw(xx + global.gameWidth - 4,yy + global.gameHeight - 16);
	#endregion
}