///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Begin Step

function scr_MKSS_Enemy_Andromeda1_Normal_BeginStep()
{
	if (!localPause)
	{
		switch (sprite_index)
		{
			case spriteSet.sprIdle:
			var _offsetShouldersF = 0;
			switch (floor(image_index))
			{
				case 1:
				case 2:
				_offsetShouldersF = 1;
				break;
				
				case 4:
				_offsetShouldersF = -1;
				break;
			}
			
			var _offsetShouldersB = 0;
			switch (floor(image_index))
			{
				case 2:
				case 3:
				case 4:
				_offsetShouldersB = 1;
				break;
			}
			
			capeOffsetX = -1 * dirX;
			capeOffsetY = -3 + _offsetShouldersB;
			
			tailOffsetX = 0 * dirX;
			tailOffsetY = 4;
			
			armLBOffsetX = -28 * dirX;
			armLBOffsetY = 8;
			armLB.x = x + armLBOffsetX;
			armLB.y = y + armLBOffsetY + _offsetShouldersF;
			armLB.dirX = dirX;
			
			armRBOffsetX = 20 * dirX;
			armRBOffsetY = 16;
			armRB.x = x + armRBOffsetX;
			armRB.y = y + armRBOffsetY + _offsetShouldersF;
			armRB.dirX = dirX;
			
			armLTOffsetX = -40 * dirX;
			armLTOffsetY = 0;
			armLT.x = x + armLTOffsetX;
			armLT.y = y + armLTOffsetY + _offsetShouldersB;
			armLT.dirX = dirX;
			
			armRTOffsetX = 34 * dirX;
			armRTOffsetY = 0;
			armRT.x = x + armRTOffsetX;
			armRT.y = y + armRTOffsetY + _offsetShouldersB;
			armRT.dirX = dirX;
			break;
		}
	}
}