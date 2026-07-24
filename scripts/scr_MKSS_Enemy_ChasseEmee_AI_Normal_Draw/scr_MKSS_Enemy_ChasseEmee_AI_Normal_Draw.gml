///@description MKSS - Enemy - Chasse Emee - AI - Normal - Draw

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_Draw()
{
	var _ship = -1;
	var shipXOffset = -1;
	var shipYOffset = -1;
	switch (sprite_index)
	{
		case spriteSet.sprIdle:
		case spriteSet.sprDash1:
		case spriteSet.sprLookDown:
		case spriteSet.sprThrust1:
		_ship = spriteSet.sprShipNormal;
		
		shipXOffset = -8;
		shipYOffset = -20;
		break;
		
		case spriteSet.sprDuck:
		_ship = spriteSet.sprShipNormal;
		
		shipXOffset = -8;
		shipYOffset = -12;
		break;
	}
	
	if (sprite_index != -1)
	{
		if ((global.shaders) and (palSprite != -1)) pal_swap_set(palSprite,palIndex,false);
		if (palSprite == -1) and (palIndex == 2) shader_set(shd_White);		
		if (_ship != -1) draw_sprite_ext(_ship,0,x + shakeXFinal + drawXOffset + (shipXOffset * dirX),y + shakeYFinal + drawYOffset + shipYOffset,image_xscale,image_yscale,imageAngle,image_blend,image_alpha);
		draw_sprite_ext(sprite_index,image_index,x + shakeXFinal + drawXOffset,y + shakeYFinal + drawYOffset,image_xscale,image_yscale,imageAngle,image_blend,image_alpha);
		if ((global.shaders) and (palSprite != -1)) pal_swap_reset();
		if (palSprite == -1) shader_reset();
	}
}