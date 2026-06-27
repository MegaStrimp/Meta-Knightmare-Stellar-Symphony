///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Background
draw_set_alpha(.5);
draw_set_color(c_black);
draw_rectangle(0,0,global.gameWidth,global.gameHeight,false);
draw_set_color(c_white);
draw_set_alpha(1);
#endregion

#region Gem
if (global.shaders) pal_swap_set(gemPalette,1,false);
draw_sprite(spr_MKSS_UI_Decal1,0,xx + (global.gameWidth / 2),yy + (global.gameHeight / 2));
if (global.shaders) pal_swap_reset();
#endregion

#region Decals
if ((global.shaders) and (global.MKSS_CurrentDecalPalette != -1)) pal_swap_set(global.MKSS_CurrentDecalPalette,1,false);
draw_sprite(spr_MKSS_UI_Decal1,0,xx + lengthdir_x(decalLength,45),yy + 160 + lengthdir_y(decalLength,45));
draw_sprite(spr_MKSS_UI_Decal2,0,xx + 240 + lengthdir_x(-decalLength,45),yy + lengthdir_y(-decalLength,45));
if ((global.shaders) and (global.MKSS_CurrentDecalPalette != -1)) pal_swap_reset();
#endregion