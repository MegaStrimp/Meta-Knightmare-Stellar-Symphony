///@description Draw

#region Draw Black Bg
draw_set_color(c_black);
draw_rectangle(0,0,xLimit,room_height,false);
draw_set_color(c_white);
#endregion

#region Draw Rectangles
for (var i = 0; i < 15; i++)
{
	draw_sprite(spr_MKSS_BgEnv_StarryShoresBlackBg_Triangle,0,xLimit,i * 16);
}
#endregion