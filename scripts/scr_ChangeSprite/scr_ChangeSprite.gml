///@description Change Sprite

function scr_ChangeSprite(spriteId,bypassAttackCheck = false)
{
	if ((spriteId != undefined) and ((!hasAttackAnimation) or (bypassAttackCheck)))
	{
		sprite_index = spriteId;
		image_index = 0;
	}
}