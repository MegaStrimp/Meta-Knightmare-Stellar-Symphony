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
			
			if (!arm[0])
			{
				armLBOffsetX = -28 * dirX;
				armLBOffsetY = 8 + _offsetShouldersF;
				armLBAngle = 0;
				armLBDir = [dirX,1];
				armLB.sprite_index = spriteSet.sprArmLB_Idle;
			}
			armLB.x = x + armLBOffsetX;
			armLB.y = y + armLBOffsetY;
			armLB.image_angle = armLBAngle;
			if (armLBAngle > 90) and (armLBAngle < 270) armLBDir[1] = -1;
			else armLBDir[1] = 1;
			armLB.dirX = armLBDir[0];
			armLB.dirY = armLBDir[1];
			
			if (!arm[1])
			{
				armRBOffsetX = 20 * dirX;
				armRBOffsetY = 16 + _offsetShouldersF;
				armRBAngle = 0;
				armRBDir = [dirX,1];
				armRB.sprite_index = spriteSet.sprArmRB_Idle;
			}
			armRB.x = x + armRBOffsetX;
			armRB.y = y + armRBOffsetY;
			armRB.image_angle = armRBAngle;
			if (armRBAngle > 90) and (armRBAngle < 270) armRBDir[1] = -1;
			else armRBDir[1] = 1;
			armRB.dirX = armRBDir[0];
			armRB.dirY = armRBDir[1];
			
			if (!arm[2])
			{
				armLTOffsetX = -40 * dirX;
				armLTOffsetY = 0 + _offsetShouldersB;
				armLTAngle = 0;
				armLTDir = [dirX,1];
				armLT.sprite_index = spriteSet.sprArmLT_Idle;
			}
			armLT.x = x + armLTOffsetX;
			armLT.y = y + armLTOffsetY;
			armLT.image_angle = armLTAngle;
			if (armLTAngle > 90) and (armLTAngle < 270) armLTDir[1] = -1;
			else armLTDir[1] = 1;
			armLT.dirX = armLTDir[0];
			armLT.dirY = armLTDir[1];
			
			if (!arm[3])
			{
				armRTOffsetX = 34 * dirX;
				armRTOffsetY = 0 + _offsetShouldersB;
				armRTAngle = 0;
				armRTDir = [dirX,1];
				armRT.sprite_index = spriteSet.sprArmRT_Idle;
			}
			armRT.x = x + armRTOffsetX;
			armRT.y = y + armRTOffsetY;
			armRT.image_angle = armRTAngle;
			if (armRTAngle > 90) and (armRTAngle < 270) armRTDir[1] = -1;
			else armRTDir[1] = 1;
			armRT.dirX = armRTDir[0];
			armRT.dirY = armRTDir[1];
			break;
		}
	}
}