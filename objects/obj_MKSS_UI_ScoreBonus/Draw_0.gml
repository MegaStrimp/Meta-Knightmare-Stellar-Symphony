///@description Draw

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Draw Self
draw_sprite(sprite_index,image_index,xx + (global.gameWidth / 2),yy + (global.gameHeight / 2));
#endregion