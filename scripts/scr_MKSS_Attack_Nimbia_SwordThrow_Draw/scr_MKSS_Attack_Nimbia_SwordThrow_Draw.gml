///@description MKSS - Attack - Nimbia - Sword Throw - Draw

function scr_MKSS_Attack_Nimbia_SwordThrow_Draw()
{
	var _x = 0;
	var _y = 0;
	with (owner)
	{
		_x = x + (25 * dirX);
		_y = y + 6;
	}
	if (image_angle == 0) or (image_angle == 180)
	{
		with (owner)
		{
			_x = x + (28 * dirX);
			_y = y - 11;
		}
	}
	
	var _segments = point_distance(x,y,_x,_y)/6;

	if ((global.shaders) and (owner.palSprite != -1)) pal_swap_set(owner.palSprite,owner.palIndex,false);
	scr_DrawSpriteLineExt(x,y,_x,_y,spr_MKSS_Attack_Nimbia_SwordThrow_Tornado,0,_segments,0,image_angle,,,.665);
	if ((global.shaders) and (owner.palSprite != -1)) pal_swap_reset();
		
	if (sprite_index != -1) draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}