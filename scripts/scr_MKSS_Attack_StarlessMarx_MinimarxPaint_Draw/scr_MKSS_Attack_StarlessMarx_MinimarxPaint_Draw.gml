///@description MKSS - Attack - Starless Marx - Minimarx Paint - Draw

function scr_MKSS_Attack_StarlessMarx_MinimarxPaint_Draw()
{
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	if (createStartTimer == -1)
	{
		draw_sprite_ext(spr_MKSS_Enemy_StarlessMinimarx_Base_Walk,0,x,y - (8 * miniScaleY),miniScaleX * miniDir,miniScaleY,image_angle,image_blend,image_alpha);
		draw_sprite_ext(spr_MKSS_Attack_StarlessMarx_MinimarxPaint_Shadow,0,x,y - (8 * miniScaleY),miniScaleX * miniDir,miniScaleY,image_angle,image_blend,miniShadowAlpha);
	}
}