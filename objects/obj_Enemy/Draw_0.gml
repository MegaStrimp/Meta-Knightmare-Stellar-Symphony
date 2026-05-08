///@description Draw

#region Shake
shakeXFinal = 0;
shakeYFinal = 0;

if (!localPause)
{
	shakeXFinal = floor(choose(-shakeX,shakeX));
	shakeYFinal = floor(choose(-shakeY,shakeY));
	
	shakeX = max(0,shakeX - .1);
	shakeY = max(0,shakeY - .1);
}
else if (global.freezeFrame)
{
	shakeXFinal = floor(choose(-shakeX,shakeX));
	shakeYFinal = floor(choose(-shakeY,shakeY));
}
#endregion

#region Draw
if (enemyDraw != -1)
{
	script_execute(enemyDraw);
}
else
{
	if (sprite_index != -1)
	{
		if ((global.shaders) and (palSprite != -1)) pal_swap_set(palSprite,palIndex,false);
		if (palSprite == -1) and (palIndex == 2) shader_set(shd_White);
		draw_sprite_ext(sprite_index,image_index,x + shakeXFinal + drawXOffset,y + shakeYFinal + drawYOffset,image_xscale,image_yscale,imageAngle,image_blend,image_alpha);
		if ((global.shaders) and (palSprite != -1)) pal_swap_reset();
		if (palSprite == -1) shader_reset();
	}
}
#endregion