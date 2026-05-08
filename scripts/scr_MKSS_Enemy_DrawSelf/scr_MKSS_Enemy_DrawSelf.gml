///@description MKSS - Enemy - Draw Self

function scr_MKSS_Enemy_DrawSelf()
{
	var xFinal = x + shakeXFinal + drawXOffset;
	var yFinal = y + shakeYFinal + drawYOffset;
	if (outlineColor[0] != -1)
	{
		var spriteXOffset = sprite_get_xoffset(sprite_index);
		var spriteYOffset = sprite_get_yoffset(sprite_index);
		
		if (image_xscale < 0) spriteXOffset = sprite_get_width(sprite_index) - spriteXOffset;
		if (image_yscale < 0) spriteYOffset = sprite_get_height(sprite_index) - spriteYOffset;
		
		xFinal = 4 + spriteXOffset * abs(image_xscale);
		yFinal = 4 + spriteYOffset * abs(image_yscale);
	}
	
	if ((global.shaders) and (palSprite != -1)) pal_swap_set(palSprite,palIndex,false);
	draw_sprite_ext(sprite_index,image_index,xFinal,yFinal,image_xscale,image_yscale,imageAngle,image_blend,image_alpha);
	if ((global.shaders) and (palSprite != -1)) pal_swap_reset();
	
	#region Shadow Mask
	if (shadowAlphaFinal != 0)
	{
		scr_DrawMask_Begin();
		
		scr_DrawMask_Mask(sprite_index,image_index,xFinal,yFinal,image_xscale,image_yscale,imageAngle,image_blend,shadowAlphaFinal / 2);
		
		gpu_set_fog(true,c_black,0,0);
		draw_sprite_ext(sprite_index,image_index,xFinal + 2,yFinal + 2,image_xscale,image_yscale,imageAngle,image_blend,image_alpha);
		gpu_set_fog(false,c_white,0,0);
		
		scr_DrawMask_End();
	}
	#endregion
}