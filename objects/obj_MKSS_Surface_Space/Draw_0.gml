///@description Draw

#region Surface
if (!surface_exists(drawSurface)) drawSurface = surface_create(global.gameWidth,global.gameHeight);

surface_set_target(drawSurface);
draw_clear_alpha(c_black,0);

draw_sprite_tiled_ext(spr_MKSS_Surface_Space,0,bgX,bgY,1,1,c_white,1);
draw_sprite_tiled_ext(spr_MKSS_Surface_Space_Stars1,0,stars1X,stars1Y,1,1,c_white,1);
draw_sprite_tiled_ext(spr_MKSS_Surface_Space_Stars2,0,stars2X,stars2Y,1,1,c_white,1);

surface_reset_target();
#endregion