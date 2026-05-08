///@description MKSS - Enemy - Trappy - AI - Throw - Animation End

function scr_MKSS_Enemy_Trappy_AI_Throw_AnimationEnd()
{
	switch (sprite_index)
	{
		case spriteSet.sprHop:
		isHopping = false;
		
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		break;
		
		case spriteSet.sprThrow:
		sprite_index = spriteSet.sprIdle;
		image_index = image_number - 1;
		break;
		
		case spriteSet.sprClose:
		sprite_index = spriteSet.sprIdle;
		image_index = 0;
		break;
	}
}