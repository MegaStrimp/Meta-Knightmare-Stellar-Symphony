function scr_MKSS_Attack_StarlessMarx_Shadow_Draw()
{
	textureSprite = spr_MKSS_Attack_StarlessMarx_ShadowTexture;
	textureWidth = sprite_get_width(textureSprite);
	textureHeight = sprite_get_height(textureSprite);
	
	scr_DrawMask_Begin();
	
	scr_DrawMask_Mask(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	for (var i = -5; i < 6; i++)
	{
		for (var h = -5; h < 6; h++)
		{
			draw_sprite(textureSprite,0,x + textureX + (textureWidth * i),y + textureY + (textureHeight * h));
		}
	}	
	
	scr_DrawMask_End();
}