///@description Draw

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Background
var colorCycle = sine_between(global.currentTimePausable,360,-4,4);
var color1 = (bgColor1 + colorCycle) % 360;
var color2 = (bgColor1 + 10 + colorCycle) % 360;
var color3 = (bgColor2 + colorCycle) % 360;
var color4 = (bgColor2 + 10 + colorCycle) % 360;

draw_rectangle_color(xx,yy,xx + global.gameWidth,yy + global.gameHeight,make_color_hsv(color1,bgSaturation1,bgValue1),make_color_hsv(color2,bgSaturation1,bgValue1),make_color_hsv(color3,bgSaturation2,bgValue2),make_color_hsv(color4,bgSaturation2,bgValue2),false);
#endregion

#region Light
var lightX = sine_between(global.currentTimePausable,lightPeriod,-20,20);
var lightY = sine_between(global.currentTimePausable,lightPeriod + 100,-20,20);

draw_sprite(bg_MKSS_Background_KSWUnderwater_Light,0,xx + lightX,yy + lightY);
draw_sprite_ext(bg_MKSS_Background_KSWUnderwater_Shine,0,xx + colorCycle,yy,1,1,0,c_white,.5);
#endregion