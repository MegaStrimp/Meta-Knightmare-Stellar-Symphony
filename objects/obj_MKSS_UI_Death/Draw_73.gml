///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

surface_set_target(surface);
draw_clear_alpha(c_black,0);

#region Background
draw_set_color(#000040);
draw_rectangle(0,0,global.gameWidth,global.gameHeight,false);
draw_set_color(c_white);
#endregion

#region Decals
if ((global.shaders) and (global.MKSS_CurrentDecalPalette != -1)) pal_swap_set(global.MKSS_CurrentDecalPalette,1,false);
draw_sprite(spr_MKSS_UI_Decal1,0,lengthdir_x(decalLength,45),160 + lengthdir_y(decalLength,45));
draw_sprite(spr_MKSS_UI_Decal2,0,240 + lengthdir_x(-decalLength,45),lengthdir_y(-decalLength,45));
if ((global.shaders) and (global.MKSS_CurrentDecalPalette != -1)) pal_swap_reset();
#endregion

#region Meta Points
draw_sprite_ext(spr_MKSS_Hud_MetaPoints_Icon,0,85,73 + (2 * (pointFlagTimer != -1)),1,1,0,c_white,1);

var displayedPoints = string_replace_all(string_format(currentMetaPoints,4,0)," ","0");
scribble("[fnt_Advance_Small][#FFFFFF]x[fnt_Advance]" + string(displayedPoints) + "[/font][/color]").draw(97,79 + (2 * (pointFlagTimer != -1)));

if ((pointTimer == -1) and (decreasedMetaPoints != 0))
{
	var displayedPoints = string_replace_all(string_format(decreasedMetaPoints,4,0)," ","0");
	scribble("[fnt_Advance_Small][#FF5656]-[fnt_Advance]" + string(displayedPoints) + "[/font][/color]").draw(97,79 + 8 - decreasedMetaPointsOffset);
}
#endregion

surface_reset_target();

#region Surface
scr_DrawMask_Begin(xx,yy,xx + global.gameWidth,yy + global.gameHeight);

draw_set_alpha(alpha);

draw_circle(global.MKSS_DeathX,global.MKSS_DeathY,circleRadius,false);

draw_set_alpha(0);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
draw_set_alpha(1);

draw_surface_ext(surface,xx,yy,1,1,0,c_white,1);

scr_DrawMask_End();
#endregion