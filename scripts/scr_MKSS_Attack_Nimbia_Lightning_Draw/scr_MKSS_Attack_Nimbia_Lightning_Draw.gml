///@description MKSS - Attack - Nimbia - Lightning - Draw

function scr_MKSS_Attack_Nimbia_Lightning_Draw()
{
	scr_DrawMask_Begin();
	
	scr_DrawMask_Mask(spr_16x16Mask,0,0,0,room_width/16,yBottom/16,0,c_white,image_alpha);
	
	if (sprite_index != -1) 
	{
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		draw_sprite_ext(sprite_index,image_index,x + lengthdir_x(sprite_width,image_angle),y + lengthdir_y(sprite_width,image_angle),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}

	scr_DrawMask_End();
}