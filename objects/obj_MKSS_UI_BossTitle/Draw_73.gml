///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Overlay
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(xx,yy,xx + global.gameWidth,yy + global.gameHeight,false);
draw_set_color(c_white);
draw_set_alpha(1);
#endregion

#region Text
scribble("[fnt_Advance_Small]" + subtext + "\n[fnt_Advance]" + text + "[/font]").align(fa_center).draw(xx + (global.gameWidth / 2),yy + (global.gameHeight / 2));
#endregion