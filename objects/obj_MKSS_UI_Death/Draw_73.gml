///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

draw_set_alpha(alpha);

#region Background
draw_set_color(#000058);
draw_rectangle(xx,yy,xx + global.gameWidth,yy + global.gameHeight,false);
draw_set_color(c_white);
#endregion

#region Meta Points
draw_sprite_ext(spr_MKSS_Hud_MetaPoints_Icon,0,xx + 80,yy + 69 + (2 * (pointFlagTimer != -1)),1,1,0,c_white,alpha);

var displayedPoints = string_replace_all(string_format(currentMetaPoints,4,0)," ","0");
scribble("[fnt_Advance_Small][#FFFFFF]x[fnt_Advance]" + string(displayedPoints) + "[/font][/color]").draw(xx + 92,yy + 79 + (2 * (pointFlagTimer != -1)));

if (pointTimer == -1)
{
	var displayedPoints = string_replace_all(string_format(decreasedMetaPoints,4,0)," ","0");
	scribble("[fnt_Advance_Small][#FF5656]-[fnt_Advance]" + string(displayedPoints) + "[/font][/color]").draw(xx + 92,yy + 79 + 12 - decreasedMetaPointsOffset);
}
#endregion

draw_set_alpha(1);