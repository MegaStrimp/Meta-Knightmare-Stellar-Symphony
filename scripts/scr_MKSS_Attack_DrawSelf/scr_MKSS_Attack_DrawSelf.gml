///@description MKSS - Attack - Draw Self

function scr_MKSS_Attack_DrawSelf()
{
	var xFinal = x;
	var yFinal = y;
	if (outlineColor[0] != -1)
	{
		var spriteXOffset = sprite_get_xoffset(sprite_index);
		var spriteYOffset = sprite_get_yoffset(sprite_index);
		
		if (image_xscale < 0) spriteXOffset = sprite_get_width(sprite_index) - spriteXOffset;
		if (image_yscale < 0) spriteYOffset = sprite_get_height(sprite_index) - spriteYOffset;
		
		xFinal = 4 + spriteXOffset * abs(image_xscale);
		yFinal = 4 + spriteYOffset * abs(image_yscale);
	}
	
	draw_sprite_ext(sprite_index,image_index,xFinal,yFinal,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}