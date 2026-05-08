///@description Draw

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Text
scribble("[alpha," + string(alpha) + "]" + text + "[/alpha]").wrap(180).align(halign,valign).draw(xx + 4 + xOffset,yy + 4 + yOffset);
#endregion