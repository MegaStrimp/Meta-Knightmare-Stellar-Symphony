///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Overlay
var overlayAlpha = sine_wave(global.currentTimePausable / 100,1,1,0) / 3;

draw_set_color(c_red);
draw_set_alpha(overlayAlpha);
draw_rectangle(xx,yy,xx + global.gameWidth,yy + global.gameHeight,false);
draw_set_color(c_white);
draw_set_alpha(1);
#endregion

#region Text
for (var i = 0; i < 3; i++)
{
	draw_sprite(spr_MKSS_UI_Warning_Text_Top,imageIndex,xx + topTextX + (topTextWidth * i),yy + topTextY);
	draw_sprite(spr_MKSS_UI_Warning_Text_Bottom,imageIndex,xx + bottomTextX + (bottomTextWidth * i),yy + bottomTextY);
}

draw_sprite_part(spr_MKSS_UI_Warning_Text_Middle,imageIndex,0,0,222 * middleTextLength,34,xx + 9,yy + 62);
#endregion

#region Decals
draw_sprite_ext(spr_MKSS_UI_Warning_Decal_Top,imageIndex,xx + 120,yy + 53,decalWidth / 240,1,0,c_white,1);
draw_sprite_ext(spr_MKSS_UI_Warning_Decal_Bottom,imageIndex,xx + 120,yy + 101,decalWidth / 240,1,0,c_white,1);
#endregion