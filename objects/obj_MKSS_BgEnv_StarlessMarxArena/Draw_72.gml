///@description Draw Begin

draw_rectangle_colour(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false);

if (global.shaders) pal_swap_set(sprBGPal,palIndex,false);

//draw sprite
draw_sprite_tiled_ext(sprBG,0,bgX,bgY,1,1,c_white,alpha);

if (global.shaders) pal_swap_reset();

for (var i = 0; i < 2; i++)
{
	draw_sprite(bg_MKSS_BgEnv_StarlessMarxArena_Fade,0,(i * starsWidth),room_height);
	
	gpu_set_blendmode(bm_add);
	draw_sprite(bg_MKSS_BgEnv_StarlessMarxArena_Stars1,0,stars1X - (i * starsWidth),0);
	draw_sprite(bg_MKSS_BgEnv_StarlessMarxArena_Stars2,0,stars2X - (i * starsWidth),0);
	draw_sprite(bg_MKSS_BgEnv_StarlessMarxArena_Stars3,0,stars3X - (i * starsWidth),0);
	gpu_set_blendmode(bm_normal);
}