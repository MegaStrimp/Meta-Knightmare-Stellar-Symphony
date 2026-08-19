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
		case spriteSet.sprClawLaunch:
		case spriteSet.sprSpitPrepare:
		case spriteSet.sprSpit:
		_ship = spriteSet.sprShipNormal;
		
		shipXOffset = -8;
		shipYOffset = -20;
		break;
		
		case spriteSet.sprUltraSwordPrepare:
		_ship = spriteSet.sprShipNormal;
		
		shipXOffset = -16 - (8 * floor(image_index));
		shipYOffset = -36 - (6 * floor(image_index));
		break;
		
		case spriteSet.sprUltraSwordSwing:
		_ship = spriteSet.sprShipNormal;
		
		shipXOffset = -16 + (8 * max(floor(image_index),1));
		shipYOffset = -32 + (6 * max(floor(image_index),1));
		break;
		
		case spriteSet.sprDuck:
		_ship = spriteSet.sprShipNormal;
		
		shipXOffset = -8;
		shipYOffset = -12;
		break;
		
		case spriteSet.sprShake:
		_ship = spriteSet.sprShipNormal;
		
		shipXOffset = -8 + (random_range(-1,1) * imageSpeed);
		shipYOffset = -20 + (random_range(-2,2) * imageSpeed);
		break;
	}
	if (enemyPhase >= 2) _ship = -1;
	
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