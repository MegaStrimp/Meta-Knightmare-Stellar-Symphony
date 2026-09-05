///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Draw

function scr_MKSS_Enemy_Andromeda1_Normal_Draw()
{
	if (sprite_index != -1)
	{
		if ((global.shaders) and (palSprite != -1)) pal_swap_set(palSprite,palIndex,false);
		if (palSprite == -1) and (palIndex == 2) shader_set(shd_White);
		if (capeSprite != -1) draw_sprite_ext(capeSprite,capeIndex,x + shakeXFinal + drawXOffset + capeOffsetX,y + shakeYFinal + drawYOffset + capeOffsetY,image_xscale,image_yscale,imageAngle,image_blend,image_alpha);
		if (tailSprite != -1) draw_sprite_ext(tailSprite,tailIndex,x + shakeXFinal + drawXOffset + tailOffsetX,y + shakeYFinal + drawYOffset + tailOffsetY,image_xscale,image_yscale,imageAngle,image_blend,image_alpha);
		draw_sprite_ext(sprite_index,image_index,x + shakeXFinal + drawXOffset,y + shakeYFinal + drawYOffset,image_xscale,image_yscale,imageAngle,image_blend,image_alpha);
		if ((global.shaders) and (palSprite != -1)) pal_swap_reset();
		if (palSprite == -1) shader_reset();
	}
}