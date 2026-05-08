///@description Draw

#region Draw Self
if ((global.shaders) and (palSprite != -1)) pal_swap_set(palSprite,1,false);
draw_self();
if ((global.shaders) and (palSprite != -1)) pal_swap_reset();
#endregion

#region Shadow Mask
if (shadowAlphaFinal != 0)
{
	scr_DrawMask_Begin();
	
	scr_DrawMask_Mask(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,shadowAlphaFinal / 2);
	
	gpu_set_fog(true,c_black,0,0);
	draw_sprite_ext(sprite_index,image_index,x + 2,y + 2,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	gpu_set_fog(false,c_white,0,0);
	
	scr_DrawMask_End();
}
#endregion