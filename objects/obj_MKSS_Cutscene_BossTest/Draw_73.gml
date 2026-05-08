///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Text
if (phase == 2) scribble("(boss cutscene happens here)\n"/* + string(time)*/).wrap(180).align(fa_center).draw(xx + (global.gameWidth / 2),yy + (global.gameHeight / 2));
#endregion