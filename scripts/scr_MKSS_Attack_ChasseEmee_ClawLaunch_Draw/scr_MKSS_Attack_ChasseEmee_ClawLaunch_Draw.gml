///@description MKSS - Attack - Chasse Emee - Claw Launch - Draw

function scr_MKSS_Attack_ChasseEmee_ClawLaunch_Draw()
{
	var _x = 0;
	var _y = 0;
	with (owner)
	{
		_x = x;// + (25 * dirX);
		_y = y;// + 6;
	}
	if (image_angle == 0) or (image_angle == 180)
	{
		with (owner)
		{
			_x = x + (36 * dirX);
			_y = y - 8;
		}
	}
	
	var _segments = point_distance(x,y,_x,_y)/24;

	if ((global.shaders) and (owner.palSprite != -1)) pal_swap_set(owner.palSprite,owner.palIndex,false);
	scr_DrawSpriteLineExt(x,y,_x,_y,spr_MKSS_Attack_ChasseEmee_ClawArm,0,_segments,0);
	if ((global.shaders) and (owner.palSprite != -1)) pal_swap_reset();
		
	if (sprite_index != -1) draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}