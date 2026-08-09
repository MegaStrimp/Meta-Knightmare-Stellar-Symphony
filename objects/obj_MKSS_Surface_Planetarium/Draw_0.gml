///@description Draw

#region Surface
if (!surface_exists(drawSurface)) drawSurface = surface_create(global.gameWidth,global.gameHeight);

surface_set_target(drawSurface);
draw_clear_alpha(c_black,0);

draw_sprite(spr_MKSS_Surface_Planetarium,0,0,0);

var starWidth = 600;
var starHeight = 400;

draw_sprite_tiled(spr_MKSS_Surface_Planetarium_Stars1,0,0 + ((current_time / (60 * 5)) % starWidth),0 - ((current_time / (10 * 5)) % starHeight));
draw_sprite_tiled(spr_MKSS_Surface_Planetarium_Stars2,0,0 + ((current_time / (60 * 4)) % starWidth),0 - ((current_time / (10 * 4)) % starHeight));
draw_sprite_tiled(spr_MKSS_Surface_Planetarium_Stars3,0,0 + ((current_time / (60 * 3)) % starWidth),0 - ((current_time / (10 * 3)) % starHeight));
draw_sprite_tiled(spr_MKSS_Surface_Planetarium_Stars4,0,0 + ((current_time / (60 * 2)) % starWidth),0 - ((current_time / (10 * 2)) % starHeight));
draw_sprite_tiled(spr_MKSS_Surface_Planetarium_Stars5,0,0 + ((current_time / (60)) % starWidth),0 - ((current_time / (10)) % starHeight));

surface_reset_target();
#endregion