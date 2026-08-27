///@description Draw Begin

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

draw_rectangle_color(xx,yy,xx + global.gameWidth,yy + global.gameHeight,c_black,c_black,c_black,c_black,false);

if (global.shaders) pal_swap_set(sprBGPal,palIndex,false);

//draw sprite
draw_sprite_tiled_ext(sprBG,0,bgX,bgY,1,1,c_white,alpha);

if (global.shaders) pal_swap_reset();

#region Overlay
if (hasOverlay)
{
	var targetAlpha = sine_between((global.currentTimePausable / 10),10,0,.5);
	
	draw_set_alpha(targetAlpha);
	draw_rectangle_color(xx,yy,xx + global.gameWidth,yy + global.gameHeight,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
}
#endregion

for (var i = 0; i < 2; i++)
{
	draw_sprite(bg_MKSS_BgEnv_StarlessMarxArena_Fade,0,(i * starsWidth),room_height);
	
	gpu_set_blendmode(bm_add);
	draw_sprite(bg_MKSS_BgEnv_StarlessMarxArena_Stars1,0,stars1X - (i * starsWidth),0);
	draw_sprite(bg_MKSS_BgEnv_StarlessMarxArena_Stars2,0,stars2X - (i * starsWidth),0);
	draw_sprite(bg_MKSS_BgEnv_StarlessMarxArena_Stars3,0,stars3X - (i * starsWidth),0);
	gpu_set_blendmode(bm_normal);
}