///@description MKSS - Attack - Andromeda 1 - Star Slash - Draw

function scr_MKSS_Attack_Andromeda1_StarSlash_Draw()
{
	scr_DrawMask_Begin();
		
	scr_DrawMask_LineMask(x + lengthdir_x(-slashLength,slashAngle),y + lengthdir_y(-slashLength,slashAngle),x + lengthdir_x(slashLength,slashAngle),y + lengthdir_y(slashLength,slashAngle),indicatorWidth,.5);
	
	for (var i = -2; i < 2; i++)
	{
		for (var h = -2; h < 2; h++)
		{
			draw_sprite_ext(textureSprite,0,x + textureX + (textureWidth * i),y + textureY + (textureHeight * h),image_xscale,image_yscale,0,c_white,1);
		}
	}
	
	scr_DrawMask_End();
	
	scr_DrawMask_Begin();
		
	scr_DrawMask_LineMask(x + lengthdir_x(-slashLength,slashAngle),y + lengthdir_y(-slashLength,slashAngle),x + lengthdir_x(slashLength,slashAngle),y + lengthdir_y(slashLength,slashAngle),gashWidth,1);
	
	for (var i = -2; i < 2; i++)
	{
		for (var h = -2; h < 2; h++)
		{
			draw_sprite_ext(textureSprite,0,x + textureX + (textureWidth * i),y + textureY + (textureHeight * h),image_xscale,image_yscale,0,c_white,1);
		}
	}
	
	scr_DrawMask_End();
	
	draw_line_width_color(x + lengthdir_x(-slashLength,slashAngle),y + lengthdir_y(-slashLength,slashAngle),x + lengthdir_x(slashLength,slashAngle),y + lengthdir_y(slashLength,slashAngle),slashWidth,c_white,c_white);
}