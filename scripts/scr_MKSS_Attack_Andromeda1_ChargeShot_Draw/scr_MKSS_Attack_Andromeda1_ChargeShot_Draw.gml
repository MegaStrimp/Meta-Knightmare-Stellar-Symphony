///@description MKSS - Attack - Andromeda 1 - Charge Shot - Draw

function scr_MKSS_Attack_Andromeda1_ChargeShot_Draw()
{
	//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale + .05,image_yscale + .05,image_angle,image_blend,image_alpha);
	
	scr_DrawMask_Begin();
		
	scr_DrawMask_Mask(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	for (var i = -2; i < 2; i++)
	{
		for (var h = -2; h < 2; h++)
		{
			draw_sprite_ext(textureSprite,0,x + textureX + (textureWidth * i),y + textureY + (textureHeight * h),1,1,0,c_white,1);
		}
	}
	
	scr_DrawMask_End();
}